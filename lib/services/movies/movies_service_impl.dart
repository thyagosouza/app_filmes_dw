// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../models/movie_model.dart';
import '../../repositories/movies/movies_repository.dart';
import 'movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  //? precisa do Repository para fazer a busca
  final MoviesRepository _moviesRepository;
  MoviesServiceImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  //? Com tudo em mãos, só precisa fazer as chamadas
  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() => _moviesRepository.getTopRated();
}
