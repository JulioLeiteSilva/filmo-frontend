import 'package:filmo/data/http/exceptions.dart';
import 'package:filmo/data/models/login_model.dart';
import 'package:filmo/data/models/sign_up_model.dart';
import 'package:filmo/data/models/user_model.dart';
import 'package:filmo/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class UserStore {
  final IUserRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<UserModel?> state = ValueNotifier<UserModel?>(null);

  final ValueNotifier<String> error = ValueNotifier('');

  UserStore({required this.repository});

  Future<void> signInUser(LoginModel loginModel) async {
    isLoading.value = true;

    try {
      final result = await repository.signInUser(loginModel);
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }

  Future<void> signUpUser(SignUpModel signUpModel) async {
    isLoading.value = true;

    try {
      await repository.signUpUser(signUpModel);
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
