// ignore_for_file: avoid_print

import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';

import '../../application/ui/loader/loader_mixin.dart';
import '../../application/ui/messages/messages_mixin.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  //* Dar acesso ao controller o loginService
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  //! mesma extratégia usada no LoginService para que não fique exposto
  LoginController({required LoginService loginService})
      : _loginService = loginService;
  //final _nome = 'Thyago Souza'.obs;
  //String nome = 'Thyago Souza';
  //String get nome => _nome.value;
  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso!!!', message: 'Login foi realizado com sucesso!'));
    } catch (e) {
      // print(e);
      //print(s); // StackTrace - toda a pilha de execução que aconteceu
      loading(false);
      message(MessageModel.error(
          title: 'Login Erro!', message: 'Erro ao realizar login'));
    }

    //! os Rx são um callable class, podem ser chamados por funçoes
    // //loading.value = true;
    // loading(true);
    // await 2.seconds.delay();
    // //await Future.delayed(const Duration(seconds: 2));
    // loading(false);
    // //Get.snackbar('test', 'test', backgroundColor: Colors.white);
    // message(
    //     MessageModel.error(title: 'Titulo error', message: 'Mensagem de erro'));
    // await 1.seconds.delay();
    // message(MessageModel.info(
    //     title: 'Titulo info', message: 'Mensagem de informação'));
    // //loading.value = false;
    // // nome = 'Joana Dark';
    // //_nome.value = 'Joana Dark';
  }
}
