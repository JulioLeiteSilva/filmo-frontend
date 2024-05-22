import 'package:filmo/view/components/tile_movie_componet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HorizontalMovieList extends StatefulWidget {
  final String listName;
  const HorizontalMovieList({
    super.key,
    required this.listName,
  });

  @override
  State<HorizontalMovieList> createState() => _HorizontalMovieListState();
}

class _HorizontalMovieListState extends State<HorizontalMovieList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    void test() {
      GoRouter.of(context).push('/movieDetails');
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              widget.listName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                5,
                (index) => MovieTile(
                    onTap: test,
                    backgroundImageAsset: "assets/images/bkgImgMovie01.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
