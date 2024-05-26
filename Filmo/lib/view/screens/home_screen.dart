import 'package:filmo/view/components/horizontal_movie_list.dart';
import 'package:filmo/view/components/tile_button_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filmo/view/stores/user_store.dart';
import 'package:filmo/view/stores/movie_store.dart';
import 'package:filmo/data/models/movie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserStore userStore;
  late MovieStore movieStore;

  static const Map<int, String> genreMapping = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western",
  };

  @override
  void initState() {
    super.initState();
    userStore = Provider.of<UserStore>(context, listen: false);
    movieStore = Provider.of<MovieStore>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRecommendations();
    });
  }

  void _loadRecommendations() {
    if (userStore.state.value != null &&
        userStore.state.value!.myList.isNotEmpty) {
      final lastMovie = userStore.state.value!.myList.last;
      if (lastMovie.genreIds.isNotEmpty) {
        final genre = lastMovie.genreIds.first.toString();
        movieStore.fetchRecommendations(lastMovie.title);
      }
    }
  }

  String _getGenreName(String genreId) {
    return genreMapping[int.parse(genreId)] ?? "Desconhecido";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Stack(
        children: [
          Consumer<MovieStore>(
            builder: (context, movieStore, child) {
              if (movieStore.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (movieStore.recommendationsByGenre.isEmpty) {
                return const Center(
                    child: Text('No recommendations available'));
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    if (userStore.state.value != null &&
                        userStore.state.value!.myList.isNotEmpty)
                      HorizontalMovieList(
                        listName: "My List",
                        movies: userStore.state.value!.myList,
                      ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: movieStore.recommendationsByGenre.entries
                              .map((entry) {
                            final genre = _getGenreName(entry.key);
                            final recommendations = entry.value;
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: HorizontalMovieList(
                                listName: "Recommendations for $genre",
                                movies: recommendations,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
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
