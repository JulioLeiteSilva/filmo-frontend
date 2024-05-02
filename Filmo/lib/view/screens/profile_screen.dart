import 'package:filmo/mixins/validations_mixin.dart';
import 'package:filmo/view/components/horizontal_movie_list.dart';
import 'package:filmo/view/components/tile_btn_component.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ValidationsMixin {
  void goToAvaliations() {}
  void exit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
              const Text(
                "Sabrina Carpenter",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 218, 218, 218)),
              ),
              const SizedBox(height: 40.0),
              TileBtnComponent(
                  btnText: "MINHAS AVALIAÇÕES", onTap: goToAvaliations),
              const SizedBox(height: 10.0),
              TileBtnComponent(btnText: "SAIR", onTap: exit),
              const SizedBox(height: 30.0),
              const HorizontalMovieList(listName: "MINHA LISTA"),
            ],
          ),
        ),
      ),
    );
  }
}
