import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../application/modules/module.dart';
import 'login_bindings.dart';
import 'login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
  ];
}
