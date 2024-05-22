import 'package:flutter/material.dart';

class ImageMovieComponent extends StatelessWidget {
  final String backgroundImageAsset;

  const ImageMovieComponent({
    super.key,
    required this.backgroundImageAsset,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.75,
      constraints: const BoxConstraints(
        maxWidth: 590,
      ),
      margin: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(backgroundImageAsset),
      ),
    );
  }
}
