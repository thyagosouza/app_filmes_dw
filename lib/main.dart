import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'application/bindings/application_bindings.dart';
import 'application/ui/filmes_app_ui_config.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/splash/splash_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //final remoteConfig = FirebaseRemoteConfig.instance;
  //remoteConfig.fetchAndActivate();
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FilmesAppUiConfig.title,
      initialBinding: ApplicationBindings(),
      theme: FilmesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
      ],
    );
  }
}
