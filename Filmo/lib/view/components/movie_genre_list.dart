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
  final List<int> genreIds; // Lista de IDs de gêneros de filme

  const MovieGenreList({
    required this.genreIds,
    Key? key,
  }) : super(key: key);

  // Mapeamento dos IDs de gêneros para os nomes dos gêneros
  static const Map<int, String> genreMapping = {
    28: "Ação",
    12: "Aventura",
    16: "Animação",
    35: "Comédia",
    80: "Crime",
    99: "Documentário",
    18: "Drama",
    10751: "Família",
    14: "Fantasia",
    36: "História",
    27: "Terror",
    10402: "Música",
    9648: "Mistério",
    10749: "Romance",
    878: "Ficção científica",
    10770: "Cinema TV",
    53: "Thriller",
    10752: "Guerra",
    37: "Faroeste",
  };

  // Função para atribuir uma cor a cada gênero de filme
  List<MovieGenre> _assignColorsToGenres(List<int> genreIds) {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.yellow,
    ];

    List<MovieGenre> movieGenres = [];

    for (int i = 0; i < genreIds.length; i++) {
      String genreName = genreMapping[genreIds[i]] ?? "Desconhecido";
      movieGenres.add(MovieGenre(name: genreName, color: colors[i % colors.length]));
    }

    return movieGenres;
  }

  @override
  Widget build(BuildContext context) {
    List<MovieGenre> movieGenres = _assignColorsToGenres(genreIds);

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
