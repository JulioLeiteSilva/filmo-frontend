import 'package:filmo/view/components/horizontal_movie_list.dart';
import 'package:filmo/view/components/tile_button_search.dart';
import 'package:filmo/view/components/tile_movie_componet.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ), // Para evitar que o conteúdo seja sobreposto pela barra de status
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Column(
                      children: [
                        HorizontalMovieList(
                          listName: "SIM",
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: HorizontalMovieList(
                            listName: "CORINTHIANS",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: HorizontalMovieList(
                            listName: "CORINTHIANS",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: HorizontalMovieList(
                            listName: "CORINTHIANS",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Componente de pesquisa fixo
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SearchTileButton(),
          ),
        ],
      ),
    );
  }
}
