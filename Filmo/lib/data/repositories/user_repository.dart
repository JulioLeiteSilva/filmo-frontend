import 'dart:convert';

import 'package:filmo/data/http/exceptions.dart';
import 'package:filmo/data/http/http_client.dart';
import 'package:filmo/data/models/login_model.dart';
import 'package:filmo/data/models/sign_up_model.dart';
import 'package:filmo/data/models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel> signInUser(LoginModel loginModel);
  Future<void> signUpUser(SignUpModel signUpModel);
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
        url: 'http://10.0.2.2:8000/api/login', body: jsonEncode(body));

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
      // Registro bem-sucedido, não há necessidade de retornar nenhum valor
      return;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A URL não foi encontrada");
    } else {
      throw Exception("Não foi possível efetuar o signUp");
    }
  }
}
