import 'package:flutter/material.dart';

class MovieTitleText extends StatelessWidget {
  final String text;
  const MovieTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
