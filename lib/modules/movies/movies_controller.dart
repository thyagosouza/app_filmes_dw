// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../../application/ui/messages/messages_mixin.dart';
import '../../models/genre_model.dart';
import '../../models/movie_model.dart';
import '../../services/genres/genres_service.dart';
import '../../services/movies/movies_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final _message = Rxn<MessageModel>();
  //? variavael para guardar a List de categorias
  final genres = <GenreModel>[].obs;
  MoviesController(
      {required GenresService genresService,
      required MoviesService moviesService})
      : _genresService = genresService,
        _moviesService = moviesService;

  //? não precisa do value porque o _genres já é uma lista
  // List<GenreModel> get genres => _genres;
  //! Declarar as duas lista a serem buscadas
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  //? PARA ECONOMIZAR BATIDAS NO BACKEND
  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final getGenresData = await _genresService.getGenres();
      //? assignAll > vai buscar todos os dados, e subscrever tudo que tiver na lista
      genres.assignAll(getGenresData);
      //? no onReady será feita a busca
      final popularMoviesData = await _moviesService.getPopularMovies();
      final topRatedMoviesData = await _moviesService.getTopRated();

      //* Fazer a atribuição
      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;
      //*
      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMoviesData;
    } catch (e) {
      _message(MessageModel.error(
          title: 'Error', message: 'Erro ao carregar dados da pagina '));
    }
  }

  void filterByName(String title) {
    //* Se o título não for vazio
    if (title.isNotEmpty) {
      //! FILTRO DIRETO NA TELA, SEM BUSCA NO BACKEND
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        //? where retorna sempre um booleano
        //* se for false ele deixa, se for true, ele remove da lista
        //? se a lista tiver algum valor, será retornado
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });
      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  //? inicialmente o genre será nulo
  void filterMoviesByGenre(GenreModel? genreModel) {
    //* comparação entre o filtro que está vindo,
    //* se é igual ao selecionado atual
    if (genreModel?.id == genreSelected.value?.id) {
      //* se for igual (se já tiver selecionado)
      genreModel = null;
    }
    genreSelected.value = genreModel;

    if (genreModel != null) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genreIds.contains(genreModel?.id);
      });
      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.genreIds.contains(genreModel?.id);
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }
}
