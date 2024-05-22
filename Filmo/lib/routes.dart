import 'package:filmo/data/services/auth_service.dart';
import 'package:filmo/view/screens/main_screen.dart';
import 'package:filmo/view/screens/sign_in_screen.dart';
import 'package:filmo/view/screens/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

final authService = AuthService();

final routes = GoRouter(
  initialLocation: '/',
  refreshListenable: authService,
  redirect: ((context, state) {
    final isAuthenticated = authService.isAuthenticated;
    final isLoginRoute = state.path == '/login';
  }),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpScreen(),
    )
  ],
);
