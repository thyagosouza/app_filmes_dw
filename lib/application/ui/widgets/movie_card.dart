// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/movie_model.dart';
import '../my_flutter_app_icons.dart';

class MovieCard extends StatelessWidget {
  //final dateFormat = DateFormat('dd/MM/y');
  final dateFormat = DateFormat('y');
  final MovieModel movie;
  MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 148,
      height: 280,
      // color: Colors.red,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    movie.posterPath,
                    width: 148,
                    height: 184,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 5),
              Text(
                dateFormat.format(DateTime.parse(movie.releaseDate)),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 70,
            right: -10,
            child: Material(
              // borderRadius: BorderRadius.circular(50),
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              elevation: 2,
              child: SizedBox(
                height: 30,
                child: IconButton(
                  iconSize: 13,
                  icon: const Icon(
                    FilmesAppIcons.heart_empty,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
