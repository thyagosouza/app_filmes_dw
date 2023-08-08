import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  // var controller = Get.put(SplashController());

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/3x/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            //  width: Get.width / 2,
            //  height: 200,
            child: Image.asset('assets/images/logo.png'),
          ),
          // child: Text(' FirebaseRemoteConfig.instance.getString(api_token),'),
        ),
      ),
    );
  }
}
