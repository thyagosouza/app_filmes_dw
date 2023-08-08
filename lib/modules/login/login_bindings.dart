import 'package:get/get.dart';

import 'login_controller.dart';

//! Services e Repositories não serão adicionados nos bindings
//! porque serão adicionados em diversos pontos do projeto
//? DEVERÁ SER ADICIONADO EM UM PONTO MAIS GENÈRICO(AMPLO)
//? PARA QUE PEGUE TODO O PROJETO (bindings do projeto todo)
class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(loginService: Get.find()));
  }
}
