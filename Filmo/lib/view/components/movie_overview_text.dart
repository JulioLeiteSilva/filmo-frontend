import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';

class MovieOverviewText extends StatelessWidget {
  final String text;

  const MovieOverviewText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ExpandableText(
        text,
        readMoreText: 'Ver mais',
        readLessText: 'Ver menos',
        trim: 4,
        linkTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ), // Defina o número máximo de linhas antes de mostrar o botão de "Ver mais"
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
