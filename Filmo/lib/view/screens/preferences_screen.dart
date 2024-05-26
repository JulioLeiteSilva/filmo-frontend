import 'package:filmo/view/components/basic_btn_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:filmo/view/components/option_btn_component.dart';
import 'package:filmo/view/stores/movie_store.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  void goToMovieList(String genre) async {
    final movieStore = Provider.of<MovieStore>(context, listen: false);
    await movieStore.fetchMoviesByGenre(genre);
    GoRouter.of(context).push('/movieList/$genre');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                child: GridView.count(
                  primary: false,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    OptionBtnComponent(
                      onTap: () => goToMovieList('action'),
                      backgroundImageAsset: 'assets/images/btn_action.png',
                    ),
                    OptionBtnComponent(
                      onTap: () => goToMovieList('animation'),
                      backgroundImageAsset: 'assets/images/btn_animation.png',
                    ),
                    OptionBtnComponent(
                      onTap: () => goToMovieList('comedy'),
                      backgroundImageAsset: 'assets/images/btn_comedy.png',
                    ),
                    OptionBtnComponent(
                      onTap: () => goToMovieList('crime'),
                      backgroundImageAsset: 'assets/images/btn_crime.png',
                    ),
                    OptionBtnComponent(
                      onTap: () => goToMovieList('fantasy'),
                      backgroundImageAsset: 'assets/images/btn_fantasy.png',
                    ),
                    OptionBtnComponent(
                      onTap: () => goToMovieList('science fiction'),
                      backgroundImageAsset: 'assets/images/btn_ficcion.png',
                    ),
                    OptionBtnComponent(
                      onTap: () => goToMovieList('horror'),
                      backgroundImageAsset: 'assets/images/btn_horror.png',
                    ),
                    OptionBtnComponent(
                      onTap: () => goToMovieList('musical'),
                      backgroundImageAsset: 'assets/images/btn_musical.png',
                    ),
                    OptionBtnComponent(
                      onTap: () => goToMovieList('romance'),
                      backgroundImageAsset: 'assets/images/btn_romance.png',
                    ),
                    OptionBtnComponent(
                      onTap: () => goToMovieList('suspense'),
                      backgroundImageAsset: 'assets/images/btn_suspense.png',
                    ),
                  ],
                ),
              ),
            ),
          ),
          BasicBtnComponent(btnText: 'FINALIZAR', onTap: () => GoRouter.of(context).push('/'))
        ],
      ),
    );
  }
}
