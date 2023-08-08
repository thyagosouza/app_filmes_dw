// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../application/ui/widgets/movie_card.dart';
import '../../../models/movie_model.dart';

class MoviesGroup extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;
  const MoviesGroup({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(8),
            width: Get.width,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 250,
            // width: Get.width,
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: movies.length,
                itemBuilder: (_, index) {
                  return MovieCard(
                    movie: movies[index],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
