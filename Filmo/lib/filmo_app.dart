import 'package:filmo/providers.dart';
import 'package:filmo/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:filmo/data/services/auth_service.dart';
import 'package:filmo/view/stores/user_store.dart';
import 'package:filmo/view/stores/movie_store.dart';
import 'package:go_router/go_router.dart';

class FilmoApp extends StatelessWidget {
  final AuthService authService;
  final UserStore userStore;
  final MovieStore movieStore;
  final GoRouter router;

  const FilmoApp({
    Key? key,
    required this.authService,
    required this.userStore,
    required this.movieStore,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MultiProvider(
      providers: providers(authService, userStore, movieStore),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        darkTheme: darkTheme,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
