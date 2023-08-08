import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  // final controller = Get.find<LoginController>();

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/3x/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.black45,
          ),
          Positioned(
            top: Get.height * .15,
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: Get.height * .06),
                  SizedBox(
                    width: Get.width * .9,
                    height: Get.height * .06,
                    child: SignInButton(
                      Buttons.Google,
                      onPressed: () {
                        controller.login();
                      },
                      text: 'Entrar com o Google',
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
