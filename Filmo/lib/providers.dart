import 'package:filmo/view/stores/user_store.dart';
import 'package:filmo/view/stores/movie_store.dart';
import 'package:provider/provider.dart';
import 'package:filmo/data/services/auth_service.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers(AuthService authService, UserStore userStore, MovieStore movieStore) {
  return [
    ChangeNotifierProvider<AuthService>.value(value: authService),
    ChangeNotifierProvider<UserStore>.value(value: userStore),
    ChangeNotifierProvider<MovieStore>.value(value: movieStore),
  ];
}
