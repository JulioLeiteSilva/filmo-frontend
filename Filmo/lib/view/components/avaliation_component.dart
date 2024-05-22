import 'package:flutter/material.dart';

class AvaliationComponent extends StatelessWidget {
  const AvaliationComponent({super.key});

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Avaliação:",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
