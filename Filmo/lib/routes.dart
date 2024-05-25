import 'package:filmo/data/services/auth_service.dart';
import 'package:filmo/view/screens/main_screen.dart';
import 'package:filmo/view/screens/movie_details_screen.dart';
import 'package:filmo/view/screens/preferences_screen.dart';
import 'package:filmo/view/screens/search_screen.dart';
import 'package:filmo/view/screens/sign_in_screen.dart';
import 'package:filmo/view/screens/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

final authService = AuthService();

final routes = GoRouter(
  initialLocation: '/',
  refreshListenable: authService,
  redirect: ((context, state) {
    final isAuthenticated = authService.isAuthenticated;
    final isLoginRoute = state.matchedLocation == '/signin';
    final isSignUpRoute = state.matchedLocation == '/signup';
    final isPreferencesRoute = state.matchedLocation == '/preferences';

    if (!isAuthenticated) {
      // Redirecionar para a página de login se não estiver autenticado e não estiver na página de login, cadastro ou preferências
      if (!isLoginRoute && !isSignUpRoute && !isPreferencesRoute) {
        return '/signin';
      }
    } else {
      // Redirecionar para a página inicial se já estiver autenticado e tentar acessar a página de login ou cadastro
      if (isLoginRoute || isSignUpRoute) {
        return '/';
      }
    }

    return null;
  }),
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
