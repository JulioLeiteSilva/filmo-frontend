import 'package:hive/hive.dart';
import 'package:filmo/data/models/movie_model.dart';

part 'movie_recommendations_model.g.dart';

@HiveType(typeId: 2)
class MovieRecommendations {
  @HiveField(0)
  final String genre;
  @HiveField(1)
  final List<MovieModel> movies;

  MovieRecommendations({
    required this.genre,
    required this.movies,
  });

  factory MovieRecommendations.fromMap(Map<String, dynamic> map) {
    return MovieRecommendations(
      genre: map['genre'],
      movies: (map['movies'] as List<dynamic>)
          .map((item) => MovieModel.fromMap(Map<String, dynamic>.from(item)))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'genre': genre,
      'movies': movies.map((movie) => movie.toMap()).toList(),
    };
  }
}
