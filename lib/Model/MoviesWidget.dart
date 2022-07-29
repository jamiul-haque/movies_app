// ignore: file_names
import 'package:flutter/material.dart';

import '../custom_style.dart';
import 'movies_Model.dart';
// import 'package:movies_app/Model/movies.dart';

class MoviesWidget extends StatelessWidget {
  final List<Movies> movies;

  // ignore: use_key_in_widget_constructors
  const MoviesWidget({required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          title: Row(
            children: [
              SizedBox(
                  width: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(movie.poster),
                  )),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: titleStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        movie.imdbId,
                        style: contentStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        movie.year,
                        style: contentStyle,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
