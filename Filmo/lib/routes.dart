import 'package:filmo/view/screens/main_screen.dart';
import 'package:filmo/view/screens/movie_details_screen.dart';
import 'package:filmo/view/screens/preferences_screen.dart';
import 'package:filmo/view/screens/search_screen.dart';
import 'package:filmo/view/screens/sign_in_screen.dart';
import 'package:filmo/view/screens/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/',
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
      builder: (context, state) => MovieDetailsScreen(),
    )
  ],
);
