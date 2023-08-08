import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  //! GetxService é uma classe sempre ativa no app, nunca disposada

  User? user;

  void init() {
    //? na hora que iniciar o init, ficar escutando do Firebase as alterações da autenticação
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //? Guardar o usuário para ser usado durante o app
      this.user = user; //* guardando dentor da instância porque ela não morre

      //* ficar checando se o usuario saiu de nulo, pra não nulo
      if (user == null) {
        Get.offAllNamed('/login');
      } else {
        Get.offAllNamed('/home');
      }
    });
  }
}
