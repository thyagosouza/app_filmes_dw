import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../movies_controller.dart';
import 'filter_tag.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(() {
          return Row(
            //* vai pegar a lista de objetos e transformar em um elemento
            children: controller.genres
                .map((g) => FilterTag(
                      model: g,
                      onPressed: () {},
                      selected: false,
                    ))
                .toList(),
          );
        }),
      ),
    );
  }
}
