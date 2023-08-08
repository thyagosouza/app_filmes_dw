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
  final _popularMoviesOriginal = <MovieModel>[];
  final _topRatedMoviesOriginal = <MovieModel>[];

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
      topRatedMovies.assignAll(topRatedMoviesData);
    } catch (e) {
      _message(MessageModel.error(
          title: 'Error', message: 'Erro ao carregar dados da pagina '));
    }
  }
}
