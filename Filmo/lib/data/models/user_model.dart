import 'package:filmo/data/models/movie_model.dart';

class UserModel {
  final String name;
  final String username;
  final String email;
  final String cellphone;
  final String token;
  final List<MovieModel> myList;

  UserModel({
    required this.name,
    required this.username,
    required this.email,
    required this.cellphone,
    required this.token,
    this.myList = const [],
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      username: map['username'],
      email: map['email'],
      cellphone: map['cellphone'],
      token: map['token'],
      myList: map['myList'] != null
          ? List<MovieModel>.from(
              map['myList'].map((movie) => MovieModel.fromMap(movie)))
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'cellphone': cellphone,
      'token': token,
      'myList': myList.map((movie) => movie.toMap()).toList(),
    };
  }
}
