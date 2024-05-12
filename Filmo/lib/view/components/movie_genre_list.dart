import 'package:filmo/view/components/movie_genre_button.dart';
import 'package:flutter/material.dart';

// Classe de modelo para representar o gênero do filme
class MovieGenre {
  final String name;
  final Color color;

  MovieGenre({
    required this.name,
    required this.color,
  });
}

class MovieGenreList extends StatelessWidget {
  final List<String> genres; // Lista de gêneros de filme

  const MovieGenreList({
    required this.genres,
    Key? key,
  }) : super(key: key);

  // Função para atribuir uma cor a cada gênero de filme
  List<MovieGenre> _assignColorsToGenres(List<String> genres) {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.yellow,
    ];

    List<MovieGenre> movieGenres = [];

    for (int i = 0; i < genres.length; i++) {
      movieGenres.add(MovieGenre(name: genres[i], color: colors[i % colors.length]));
    }

    return movieGenres;
  }

  @override
  Widget build(BuildContext context) {
    List<MovieGenre> movieGenres = _assignColorsToGenres(genres);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movieGenres.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: MovieGenreButton(
            genre: movieGenres[index].name,
            color: movieGenres[index].color,
          ),
        );
      },
    );
  }
}

