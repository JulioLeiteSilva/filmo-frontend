import 'package:flutter/material.dart';
import 'package:filmo/data/models/movie_model.dart';

class MovieTile extends StatelessWidget {
  final VoidCallback onTap;
  final MovieModel movie;

  const MovieTile({
    super.key,
    required this.onTap,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.38,
        constraints: const BoxConstraints(
          maxWidth: 190,
        ),
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/${movie.posterPath}', // Assuming you have a posterPath field
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
