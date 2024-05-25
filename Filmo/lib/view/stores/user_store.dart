import 'package:filmo/data/http/exceptions.dart';
import 'package:filmo/data/models/login_model.dart';
import 'package:filmo/data/models/sign_up_model.dart';
import 'package:filmo/data/models/user_model.dart';
import 'package:filmo/data/repositories/user_repository.dart';
import 'package:filmo/routes.dart';
import 'package:flutter/material.dart';

class UserStore with ChangeNotifier {
  final IUserRepository repository;

  UserStore({required this.repository});

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<UserModel?> state = ValueNotifier<UserModel?>(null);
  final ValueNotifier<String> error = ValueNotifier('');

  Future<void> signInUser(LoginModel loginModel) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await repository.signInUser(loginModel);
      state.value = result;
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

  // Future<void> logout() async {
  //   _setLoading(true);
  //   _clearError();

  //   try {
  //     await repository.logout();
  //     state.value = null;
  //     notifyListeners();
  //   } catch (e) {
  //     _setError(e.toString());
  //   }

  //   _setLoading(false);
  // }

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
