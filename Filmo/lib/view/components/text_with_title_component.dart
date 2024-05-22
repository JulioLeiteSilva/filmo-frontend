import 'package:flutter/material.dart';

class TextWithTitleComponent extends StatelessWidget {
  final String title;
  final List<String> texts;

  const TextWithTitleComponent({
    super.key,
    required this.title,
    required this.texts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          height: 15.0, // Adjust the height as necessary
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: texts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  texts[index],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
