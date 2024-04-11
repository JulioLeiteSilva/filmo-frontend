import 'package:filmo/view/components/horizontal_movie_list.dart';
import 'package:filmo/view/components/tile_movie_componet.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          // child: MovieTile(
          //     onTap: test,
          //     backgroundImageAsset: "assets/images/bkgImgMovie01.png"),
          child: Container(child: Column(
            children: [
              HorizontalMovieList(listName: "SIM",),
              HorizontalMovieList(listName: "SIM",),
              HorizontalMovieList(listName: "SIM",),
              HorizontalMovieList(listName: "SIM",),
              HorizontalMovieList(listName: "CORINTHIANS",),
            ],
          )),
        ),
      ),
    );
  }
}
