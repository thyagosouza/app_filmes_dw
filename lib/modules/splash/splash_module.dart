import 'package:app_filmes/modules/splash/splash_bindings.dart';
import 'package:app_filmes/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../application/modules/module.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      //! binding => executado antes de carregar a página, no metodo dependencies
      binding: SplashBindings(),
    ),
  ];
}
