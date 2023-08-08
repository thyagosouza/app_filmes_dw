import 'package:app_filmes/models/genre_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../application/rest_client/rest_client.dart';
import 'genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  //? os atributos tem que ficar na camada de repository privado
  //* habilitando eles para fora
  final RestClient _restClient;
  GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<List<GenreModel>> getGenres() async {
    //? com tudo pronto, buscar os results
    final result =
        await _restClient.get<List<GenreModel>>('/genre/movie/list', query: {
      'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
    },
            //? decoder é responsável por pegar a String e transformar em modelo
            //* recebe o data que vem em json()
            decoder: (data) {
      final resultData = data['genres'];
      if (resultData != null) {
        //* fazer um looping convertendo o result data
        //* mapa transforma uma lista de map(chave, valor) em um modelo
        //? desse modo o elemento de chave/valor é transformado em modelo
        return resultData
            .map<GenreModel>((g) => GenreModel.fromMap(g))
            .toList();
      }
      //* caso seja nulo, retorna um array vazio
      return <GenreModel>[];
    });
    //* com o result na mão
    if (result.hasError) {
      print(result.statusText);
      throw Exception('Erro ao buscar Genres');
    }
    return result.body ?? <GenreModel>[];
  }
}
