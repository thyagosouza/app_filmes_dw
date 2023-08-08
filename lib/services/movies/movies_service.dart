import '../../models/movie_model.dart';

abstract class MoviesService {
  //? Declarar os metodos para fazer a busca
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
}
