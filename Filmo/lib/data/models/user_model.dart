import 'package:hive/hive.dart';
import 'movie_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String cellphone;

  @HiveField(4)
  final String token;

  @HiveField(5)
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
