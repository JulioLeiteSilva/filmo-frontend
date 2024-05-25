import 'package:filmo/data/http/http_client.dart';
import 'package:filmo/view/stores/user_store.dart';
import 'package:provider/provider.dart';
import 'package:filmo/data/services/auth_service.dart';
import 'package:filmo/data/repositories/user_repository.dart';
import 'package:provider/single_child_widget.dart';

final IUserRepository userRepository = UserRepository(
  client: HttpClient(),
); // Ajuste conforme necessário
final UserStore userStore = UserStore(
  repository: userRepository,
);
final AuthService authService = AuthService();

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthService>.value(value: authService),
  ChangeNotifierProvider<UserStore>.value(value: userStore),
];
