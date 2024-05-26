import 'dart:convert';

import 'package:filmo/data/http/exceptions.dart';
import 'package:filmo/data/http/http_client.dart';
import 'package:filmo/data/models/login_model.dart';
import 'package:filmo/data/models/movie_model.dart';
import 'package:filmo/data/models/sign_up_model.dart';
import 'package:filmo/data/models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel> signInUser(LoginModel loginModel);
  Future<void> signUpUser(SignUpModel signUpModel);
  Future<void> addTitleToUserList(String email, String title, String token);
  Future<void> removeTitleToUserList(String email, String title, String token);
}

class UserRepository implements IUserRepository {
  final IHttpClient client;

  UserRepository({required this.client});

  @override
  Future<UserModel> signInUser(LoginModel loginModel) async {
    final Map<String, dynamic> body = {
      'email': loginModel.email,
      'password': loginModel.password,
    };

    final response = await client.post(
        //url: 'http://localhost:8000/api/login', body: jsonEncode(body));
        url: 'http://10.0.2.2:8000/api/login',
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      final UserModel user;

      final body = jsonDecode(response.body);

      user = UserModel.fromMap(body['user']);

      return user;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A url não foi encontrada");
    } else {
      throw Exception("Não foi possivel efetuar login");
    }
  }

  @override
  Future<void> signUpUser(SignUpModel signUpModel) async {
    final Map<String, dynamic> body = {
      'name': signUpModel.name,
      'username': signUpModel.username,
      'email': signUpModel.email,
      'cellphone': signUpModel.cellphone,
      'password': signUpModel.password,
    };

    final response = await client.post(
      //url: 'http://localhost:8000/api/create',
      url: 'http://10.0.2.2:8000/api/create',
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A URL não foi encontrada");
    } else {
      throw Exception("Não foi possível efetuar o signUp");
    }
  }

  @override
  Future<void> addTitleToUserList(
      String email, String title, String token) async {
    final Map<String, dynamic> body = {
      'email': email,
      'title': title,
    };
    final response = await client.post(
      url: 'http://10.0.2.2:8000/api/myListAddTittle',
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add title');
    }
  }

  @override
  Future<void> removeTitleToUserList(
      String email, String title, String token) async {
    final Map<String, dynamic> body = {
      'email': email,
      'title': title,
    };
    final response = await client.post(
      url: 'http://10.0.2.2:8000/api/myListDeleteTittle',
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add title');
    }
  }
}
