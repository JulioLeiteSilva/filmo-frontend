class UserModel {
  final String name;
  final String username;
  final String email;
  final String cellphone;
  final String token;

  UserModel(
      {required this.name,
      required this.username,
      required this.email,
      required this.cellphone,
      required this.token});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'],
        username: map['username'],
        email: map['email'],
        cellphone: map['cellphone'],
        token: map['token']);
  }
}
