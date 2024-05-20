import 'package:filmo/view/components/option_btn_component.dart';
import 'package:filmo/view/screens/home_screen.dart';
import 'package:filmo/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  void goToHome() {
    GoRouter.of(context).push('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SizedBox(
            child: GridView.count(
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                OptionBtnComponent(
                    onTap: goToHome,
                    backgroundImageAsset: 'assets/images/btn_action.png')
              ],
            ),
          ))
        ],
      ),
    );
  }
}


/*
class ImageGrid extends StatelessWidget {
  // Simula a obtenção de imagens do banco de dados
  Future<List<String>> fetchImagesFromDatabase() async {
    // Aqui você faria a chamada real para o seu banco de dados
    // Simulando um atraso
    await Future.delayed(Duration(seconds: 2));
    return List<String>.generate(20, (index) => 'https://picsum.photos/200?random=$index');
  }
*/ 