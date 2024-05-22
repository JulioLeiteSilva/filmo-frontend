import 'package:filmo/view/components/avaliation_component.dart';
import 'package:filmo/view/components/image_movie_component.dart';
import 'package:filmo/view/components/movie_genre_button.dart';
import 'package:filmo/view/components/movie_genre_list.dart';
import 'package:filmo/view/components/movie_overview_text.dart';
import 'package:filmo/view/components/movie_title_text.dart';
import 'package:filmo/view/components/text_with_title_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    String movieTitle = "Corinthians Minha Vida";
    String movieOverviewText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas erat nibh, mollis at fringilla a, volutpat nec ante. Integer sit amet ante lobortis, cursus justo quis, pulvinar dolor. Nullam id sem elit. Suspendisse viverra ipsum massa, vitae aliquet arcu ullamcorper ut. Duis hendrerit, tortor ut tristique congue, nibh velit egestas tortor, ut porttitor nisi justo at orci. Proin pulvinar ante et nisl accumsan pulvinar. Aliquam sit amet sem justo.";
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                          )),
                    ),
                    const Center(
                      child: ImageMovieComponent(
                          backgroundImageAsset:
                              "assets/images/bkgImgMovie01.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 20,
                        right: 20,
                      ),
                      child: MovieTitleText(text: movieTitle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 20,
                        right: 20,
                      ),
                      child: MovieOverviewText(
                        text: movieOverviewText,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                        left: 20,
                        right: 20,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 1000, // Defina a altura desejada
                        child: MovieGenreList(
                          genres: ["Ação", "Aventura", "Drama"],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: TextWithTitleComponent(
                        title: "Elenco:",
                        texts: [
                          "Teste 1",
                          "Teste 2",
                          "Teste 3",
                          "Teste 4",
                          "Teste 5",
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: TextWithTitleComponent(
                        title: "Direção:",
                        texts: [
                          "Teste 1",
                          "Teste 2",
                          "Teste 3",
                          "Teste 4",
                          "Teste 5",
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: AvaliationComponent(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
