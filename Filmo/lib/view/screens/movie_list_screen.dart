import 'package:filmo/view/components/tile_movie_componet.dart';
import 'package:filmo/view/stores/movie_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filmo/data/models/movie_model.dart';
import 'package:go_router/go_router.dart';

class MovieListScreen extends StatefulWidget {
  final String genre;

  const MovieListScreen({super.key, required this.genre});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  void initState() {
    super.initState();
    final movieStore = Provider.of<MovieStore>(context, listen: false);
    movieStore.loadMoviesFromLocal(widget.genre);
  }

  void goToMovieDetails(MovieModel movie) {
    GoRouter.of(context).push('/movieDetails', extra: movie);
  }

  @override
  Widget build(BuildContext context) {
    final movieStore = Provider.of<MovieStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies - ${widget.genre}'),
      ),
      body: movieStore.isLoading
          ? const Center(child: CircularProgressIndicator())
          : movieStore.error.isNotEmpty
              ? Center(child: Text('Error: ${movieStore.error}'))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount:
                      movieStore.moviesByGenre[widget.genre]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final movie =
                        movieStore.moviesByGenre[widget.genre]![index];
                    return MovieTile(
                      onTap: () => goToMovieDetails(movie),
                      movie: movie,
                    );
                  },
                ),
    );
  }
}
