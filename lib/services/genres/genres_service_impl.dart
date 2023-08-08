// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';

import 'genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;
  GenresServiceImpl({
    required GenresRepository genresRepository,
  }) : _genresRepository = genresRepository;

  //? o metodo fará um PROXY PARA _genresRepository.getGenres()
  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres();
}
