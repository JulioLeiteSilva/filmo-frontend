import 'package:filmo/view/components/avaliation_component.dart';
import 'package:filmo/view/components/image_movie_component.dart';
import 'package:filmo/view/components/movie_genre_list.dart';
import 'package:filmo/view/components/movie_overview_text.dart';
import 'package:filmo/view/components/movie_title_text.dart';
import 'package:flutter/material.dart';
import 'package:filmo/data/models/movie_model.dart';
import 'package:provider/provider.dart';
import 'package:filmo/view/stores/user_store.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    final isMovieInList =
        userStore.state.value?.myList.any((m) => m.title == movie.title) ??
            false;

    void addToMyList() async {
      await userStore
          .addTitleToMyList(movie); // Adiciona o objeto MovieModel completo
    }

    Future<void> removeFromMyList() async {
      await userStore.removeTitleFromMyList(movie);
    }

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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                            IconButton(
                              onPressed: isMovieInList
                                  ? removeFromMyList
                                  : addToMyList,
                              icon: isMovieInList
                                  ? const Icon(Icons.remove)
                                  : const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${movie.posterPath}', // Assuming you have a posterPath field
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 20,
                        right: 20,
                      ),
                      child: MovieTitleText(text: movie.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 20,
                        right: 20,
                      ),
                      child: MovieOverviewText(
                        text: movie.overview,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 20,
                        right: 20,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 1000, // Defina a altura desejada
                        child: MovieGenreList(
                          genreIds: movie.genreIds
                              .map((id) => id)
                              .toList(), // Convert genre IDs to strings
                        ),
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
