import 'package:filmo/data/http/http_client.dart';
import 'package:filmo/data/models/movie_model.dart';
import 'package:filmo/data/models/movie_recommendations_model.dart';
import 'package:filmo/data/models/user_model.dart';
import 'package:filmo/data/repositories/user_repository.dart';
import 'package:filmo/data/repositories/movie_repository.dart';
import 'package:filmo/data/services/auth_service.dart';
import 'package:filmo/filmo_app.dart';
import 'package:filmo/view/stores/user_store.dart';
import 'package:filmo/view/stores/movie_store.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:filmo/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(MovieModelAdapter());
  Hive.registerAdapter(MovieRecommendationsAdapter());

  var authBox = await Hive.openBox('authBox');
  var userBox = await Hive.openBox('userBox');
  var recommendationsBox = await Hive.openBox('recommendationsBox');

  final authService = AuthService();
  await authService.loadAuthState();

  final httpClient = HttpClient();
  final userRepository = UserRepository(client: httpClient);
  final userStore =
      UserStore(repository: userRepository, authService: authService);
  await userStore.loadUserFromLocal(userBox);

  final movieRepository =
      MovieRepository(client: httpClient, baseUrl: 'http://10.0.2.2:8000/api');
  final movieStore =
      MovieStore(repository: movieRepository, authService: authService);
  await movieStore.loadRecommendationsFromLocal();

  final router = createRouter(authService);

  runApp(FilmoApp(
      authService: authService,
      userStore: userStore,
      movieStore: movieStore,
      router: router));
}
