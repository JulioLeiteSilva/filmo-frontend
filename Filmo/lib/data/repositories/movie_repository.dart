import 'dart:convert';
import 'package:filmo/data/http/http_client.dart';
import 'package:filmo/data/models/movie_model.dart';

class MovieRepository {
  final IHttpClient client;
  final String baseUrl;

  MovieRepository({required this.client, required this.baseUrl});

  Future<List<MovieModel>> getMoviesByGenre(String genre, String token) async {
    final Map<String, dynamic> body = {
      'genre': genre,
    };

    final response = await client.post(
      url: '$baseUrl/bestRatedMoviesTittle',
      body: jsonEncode(body),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((movie) => MovieModel.fromMap(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieModel>> getRecommendations(String title, String token) async {
    final response = await client.post(
      url: '$baseUrl/recomendation',
      body: jsonEncode({'name': title}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get recommendations');
    }

    final List<dynamic> data = jsonDecode(response.body);
    return data.map((item) => MovieModel.fromMap(item)).toList();
  }
}
