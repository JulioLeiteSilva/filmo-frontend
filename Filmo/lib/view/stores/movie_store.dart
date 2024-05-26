import 'package:flutter/material.dart';
import 'package:filmo/data/repositories/movie_repository.dart';
import 'package:filmo/data/models/movie_model.dart';
import 'package:filmo/data/models/movie_recommendations_model.dart';
import 'package:filmo/data/services/auth_service.dart';
import 'package:hive/hive.dart';

class MovieStore with ChangeNotifier {
  final MovieRepository repository;
  final AuthService authService;

  MovieStore({required this.repository, required this.authService});

  Map<String, List<MovieModel>> _moviesByGenre = {};
  Map<String, List<MovieModel>> _recommendationsByGenre = {};
  bool _isLoading = false;
  String _error = '';

  Map<String, List<MovieModel>> get moviesByGenre => _moviesByGenre;
  Map<String, List<MovieModel>> get recommendationsByGenre => _recommendationsByGenre;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchMoviesByGenre(String genre) async {
    _isLoading = true;
    notifyListeners();

    try {
      final token = authService.token;
      if (token == null) throw Exception('User not authenticated');

      final movies = await repository.getMoviesByGenre(genre, token);
      _moviesByGenre[genre] = movies;
      await _saveMoviesToLocal(genre, movies);
      _error = '';
    } catch (e) {
      _moviesByGenre[genre] = [];
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoviesFromLocal(String genre) async {
    final box = await Hive.openBox('moviesBox');
    final movies = box.get(genre, defaultValue: <MovieModel>[]);
    _moviesByGenre[genre] = movies.cast<MovieModel>();
    notifyListeners();
  }

  Future<void> _saveMoviesToLocal(String genre, List<MovieModel> movies) async {
    final box = await Hive.openBox('moviesBox');
    await box.put(genre, movies);
  }

  Future<void> fetchRecommendations(String title) async {
    _isLoading = true;
    notifyListeners();

    try {
      final token = authService.token;
      if (token == null) throw Exception('User not authenticated');

      final recommendations = await repository.getRecommendations(title, token);

      Map<String, List<MovieModel>> genreMap = {};
      for (var movie in recommendations) {
        if (movie.genreIds.isNotEmpty) {
          final genre = movie.genreIds.first.toString();
          if (!genreMap.containsKey(genre)) {
            genreMap[genre] = [];
          }
          genreMap[genre]!.add(movie);
        }
      }

      _recommendationsByGenre = genreMap;
      await _saveRecommendationsToLocal(genreMap);
      _error = '';
    } catch (e) {
      //_recommendationsByGenre = {};
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadRecommendationsFromLocal() async {
    final box = await Hive.openBox('recommendationsBox');
    final recommendationsList = box.get('recommendations', defaultValue: <Map<String, dynamic>>[]);
    if (recommendationsList.isNotEmpty) {
      _recommendationsByGenre = {
        for (var rec in recommendationsList)
          rec['genre']: (rec['movies'] as List<dynamic>).map((item) => MovieModel.fromMap(Map<String, dynamic>.from(item))).toList()
      };
      notifyListeners();
    }
  }

  Future<void> _saveRecommendationsToLocal(Map<String, List<MovieModel>> recommendations) async {
    final box = await Hive.openBox('recommendationsBox');
    await box.put(
      'recommendations',
      recommendations.entries.map((entry) => {'genre': entry.key, 'movies': entry.value.map((movie) => movie.toMap()).toList()}).toList(),
    );
  }
}
