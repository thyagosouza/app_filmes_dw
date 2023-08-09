import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../movies_controller.dart';

class MoviesHeader extends GetView<MoviesController> {
  const MoviesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * .25,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * .25,
            child: Image.asset(
              'assets/images/3x/header.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            width: Get.width * .9,
            child: TextField(
              onChanged: (value) => controller.filterByName(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Procurar filmes',
                labelStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
                prefixIcon: const Icon(Icons.search),
                contentPadding: EdgeInsets.zero,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
