// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../../services/login/login_service.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  static const INDEX_PAGE_EXIT = 2;
  final LoginService _loginService;
  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;
  final _pages = ['/movies', '/favorites'];

  //* variável observável para controlar os botões da bottomBar
  final _pageIndex = 0.obs;

  //* encapsulando para que o pageIndex não seja alterado
  //* a não ser que seja alterado em uma página cadastrada abaixo
  int get pageIndex => _pageIndex.value;
  void goToPage(int page) {
    _pageIndex(page);
    if (page == INDEX_PAGE_EXIT) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
    }
    // switch (page) {
    //   case 1:
    //     Get.offNamed('/favorites', id: NAVIGATOR_KEY);
    //   case 0:
    //     Get.offNamed('/movies', id: NAVIGATOR_KEY);
    // }
  }
}
