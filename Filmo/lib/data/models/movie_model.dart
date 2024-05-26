import 'package:hive/hive.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 1)
class MovieModel {
  @HiveField(0)
  final bool adult;

  @HiveField(1)
  final String backdropPath;

  @HiveField(2)
  final List<int> genreIds;

  @HiveField(3)
  final int id;

  @HiveField(4)
  final String originalLanguage;

  @HiveField(5)
  final String originalTitle;

  @HiveField(6)
  final String overview;

  @HiveField(7)
  final double popularity;

  @HiveField(8)
  final String posterPath;

  @HiveField(9)
  final String releaseDate;

  @HiveField(10)
  final String title;

  @HiveField(11)
  final bool video;

  @HiveField(12)
  final double voteAverage;

  @HiveField(13)
  final int voteCount;

  static const String defaultImagePath = "/1E5baAaEse26fej7uHcjOgEE2t2.jpg";

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromMap(Map<dynamic, dynamic> map) {
    return MovieModel(
      adult: map['adult'],
      backdropPath: map['backdrop_path'] ?? defaultImagePath,
      genreIds: List<int>.from(map['genre_ids']),
      id: map['id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'].toDouble(),
      posterPath: map['poster_path'] ?? defaultImagePath,
      releaseDate: map['release_date'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average'].toDouble(),
      voteCount: map['vote_count'],
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
