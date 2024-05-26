import 'package:filmo/data/http/exceptions.dart';
import 'package:filmo/data/models/login_model.dart';
import 'package:filmo/data/models/movie_model.dart';
import 'package:filmo/data/models/sign_up_model.dart';
import 'package:filmo/data/models/user_model.dart';
import 'package:filmo/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:filmo/data/services/auth_service.dart';
import 'package:hive/hive.dart';

class UserStore with ChangeNotifier {
  final IUserRepository repository;
  final AuthService authService;

  UserStore({required this.repository, required this.authService});

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<UserModel?> state = ValueNotifier<UserModel?>(null);
  final ValueNotifier<String> error = ValueNotifier('');

  Future<void> signInUser(LoginModel loginModel) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await repository.signInUser(loginModel);
      state.value = result;
      await authService.login(result.token);
      await _saveUserToLocal(result);
      notifyListeners();
    } on NotFoundException catch (e) {
      _setError(e.message);
    } catch (e) {
      _setError(e.toString());
    }

    _setLoading(false);
  }

  Future<void> signUpUser(SignUpModel signUpModel) async {
    _setLoading(true);
    _clearError();

    try {
      await repository.signUpUser(signUpModel);
      notifyListeners();
    } on NotFoundException catch (e) {
      _setError(e.message);
    } catch (e) {
      _setError(e.toString());
    }

    _setLoading(false);
  }

  Future<void> logout() async {
    _setLoading(true);
    _clearError();

    try {
      state.value = null;
      await authService.logout();
      await _clearLocalUserData();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    }

    _setLoading(false);
  }

  Future<void> loadUserFromLocal(Box box) async {
    final userMap = box.get('user');
    if (userMap != null) {
      state.value = UserModel.fromMap(Map<String, dynamic>.from(userMap));
      notifyListeners();
    }
  }

  Future<void> addTitleToMyList(MovieModel movie) async {
    if (state.value == null) return;

    isLoading.value = true;
    try {
      final email = state.value!.email;
      final token = authService.token!;
      await repository.addTitleToUserList(email, movie.title, token);

      state.value!.myList.add(movie);
      notifyListeners();

      // Salva o estado atualizado no Hive
      final box = await Hive.openBox('userBox');
      await box.put('user', state.value!.toMap());
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeTitleFromMyList(MovieModel movie) async {
    if (state.value == null) return;

    isLoading.value = true;
    try {
      final email = state.value!.email;
      final token = authService.token!;
      await repository.removeTitleToUserList(email, movie.title, token);

      state.value!.myList.removeWhere((m) => m.title == movie.title);
      notifyListeners();

      // Salva o estado atualizado no Hive
      final box = await Hive.openBox('userBox');
      await box.put('user', state.value!.toMap());
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveUserToLocal(UserModel user) async {
    var box = await Hive.openBox('userBox');
    await box.put('user', user.toMap());
  }

  Future<void> _clearLocalUserData() async {
    var box = await Hive.openBox('userBox');
    await box.delete('user');
  }

  void _setLoading(bool value) {
    isLoading.value = value;
    notifyListeners();
  }

  void _clearError() {
    error.value = '';
    notifyListeners();
  }

  void _setError(String message) {
    error.value = message;
    notifyListeners();
  }
}
