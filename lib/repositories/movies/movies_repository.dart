import '../../models/movie_model.dart';

abstract class MoviesRepository {
  //? Declarar os metodos para fazer a busca
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
}
