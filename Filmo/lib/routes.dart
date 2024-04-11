import 'package:filmo/test.dart';
import 'package:filmo/view/screens/home_screen.dart';
import 'package:filmo/view/screens/sign_in_screen.dart';
import 'package:filmo/view/screens/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
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
