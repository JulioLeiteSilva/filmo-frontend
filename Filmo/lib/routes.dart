import 'package:filmo/data/services/auth_service.dart';
import 'package:filmo/view/screens/main_screen.dart';
import 'package:filmo/view/screens/movie_details_screen.dart';
import 'package:filmo/view/screens/movie_list_screen.dart';
import 'package:filmo/view/screens/preferences_screen.dart';
import 'package:filmo/view/screens/search_screen.dart';
import 'package:filmo/view/screens/sign_in_screen.dart';
import 'package:filmo/view/screens/sign_up_screen.dart';
import 'package:filmo/view/stores/user_store.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'data/models/movie_model.dart';

GoRouter createRouter(AuthService authService) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: authService,
    redirect: (context, state) {
      final isAuthenticated = authService.isAuthenticated;
      final isLoginRoute = state.matchedLocation == '/signin';
      final isSignUpRoute = state.matchedLocation == '/signup';
      final isPreferencesRoute = state.matchedLocation == '/preferences';
      final isMovieListRoute = state.matchedLocation.startsWith('/movieList/');
      final isMovieDetailsRoute = state.matchedLocation == '/movieDetails';

      if (!isAuthenticated) {
        if (!isLoginRoute && !isSignUpRoute && !isPreferencesRoute) {
          return '/signin';
        }
      } else {
        final userStore = Provider.of<UserStore>(context, listen: false);
        final user = userStore.state.value;
        if (user != null &&
            user.myList.isEmpty &&
            !isPreferencesRoute &&
            !isMovieListRoute &&
            !isMovieDetailsRoute) {
          return '/preferences';
        }
        if (isLoginRoute || isSignUpRoute) {
          return '/';
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => SearchScreen(),
      ),
      GoRoute(
        path: '/preferences',
        builder: (context, state) => PreferenceScreen(),
      ),
      GoRoute(
        path: '/movieDetails',
        builder: (context, state) {
          final movie = state.extra as MovieModel;
          return MovieDetailsScreen(movie: movie);
        },
      ),
      GoRoute(
        path: '/movieList/:genre',
        builder: (context, state) {
          final genre = state.pathParameters['genre']!;
          return MovieListScreen(genre: genre);
        },
      ),
    ],
  );
}
