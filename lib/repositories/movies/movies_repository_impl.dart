// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../application/rest_client/rest_client.dart';
import '../../models/movie_model.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  //? Primeira coisa pra começar as buscas
  final RestClient _restClient;
  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      //? query -> precisa ser sempre um mapa de Strings
      query: <String, String>{
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
      },
      //? decoder vai receber um valor 'data'
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
        }
        //? se der tudo errado retorna lista vazia[]
        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print('Erro ao buscar Popular Movies [${result.statusText}]');
      //* e subir uma exception
      throw Exception('Erro ao buscar Filmes Populares');
    }
    //? se der tudo certo, voltar com lista do body
    //* como body tem opcional de null, tem que dar opção de volta
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      //? query -> precisa ser sempre um mapa de Strings
      query: <String, String>{
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
      },
      //? decoder vai receber um valor 'data'
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
        }
        //? se der tudo errado retorna lista vazia[]
        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print('Erro ao buscar Popular Movies [${result.statusText}]');
      //* e subir uma exception
      throw Exception('Erro ao buscar Filmes Populares');
    }
    //? se der tudo certo, voltar com lista do body
    //* como body tem opcional de null, tem que dar opção de volta
    return result.body ?? <MovieModel>[];
  }
}
