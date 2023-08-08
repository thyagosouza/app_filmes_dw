import 'package:app_filmes/repositories/login_repository_impl.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';

import '../../repositories/login_repository.dart';
import '../../repositories/movies/movies_repository.dart';
import '../../repositories/movies/movies_repository_impl.dart';
import '../../services/login/login_service_impl.dart';
import '../../services/movies/movies_service.dart';
import '../../services/movies/movies_service_impl.dart';
import '../auth/auth_service.dart';
import '../rest_client/rest_client.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    //* lazyPut do LoginRepository que vai instanciar o LoginRepositoryImpl()
    //? como tá trabalhando com interface, precisa dizer ao GetX que
    //? quem é a interface no tipo e passa a implementação
    //! fenix: Usado para que não mate a instância quando sair da tela
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<LoginService>(
      () => LoginServiceImpl(loginRepository: Get.find()),
      fenix: true,
    );

    //? isso fará que na hora de carregar a aplicação, verifica se tá tudo ok
    //? se tá logado ou não.
    //? starta o listenen dentro do firebase

    Get.put(AuthService()).init();
    Get.lazyPut<MoviesRepository>(
      () => MoviesRepositoryImpl(restClient: Get.find()),
    );
    Get.lazyPut<MoviesService>(
      () => MoviesServiceImpl(moviesRepository: Get.find()),
    );
  }
}
