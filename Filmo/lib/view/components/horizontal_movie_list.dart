import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:filmo/view/components/tile_movie_componet.dart'; // Certifique-se de importar corretamente
import 'package:filmo/data/models/movie_model.dart';

class HorizontalMovieList extends StatefulWidget {
  final String listName;
  final List<MovieModel> movies; // Adicione uma lista de MovieModel como parâmetro

  const HorizontalMovieList({
    super.key,
    required this.listName,
    required this.movies, // Adicione este parâmetro ao construtor
  });

  @override
  State<HorizontalMovieList> createState() => _HorizontalMovieListState();
}

class _HorizontalMovieListState extends State<HorizontalMovieList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void goToMovieDetails(MovieModel movie) {
      GoRouter.of(context).push('/movieDetails', extra: movie);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              widget.listName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              children: widget.movies.map((movie) {
                return MovieTile(
                  onTap: () => goToMovieDetails(movie),
                  movie: movie,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
