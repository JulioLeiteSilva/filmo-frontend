import 'package:flutter/material.dart';

class MovieGenreButton extends StatelessWidget {
  final String genre;
  final Color color;

  const MovieGenreButton({
    super.key,
    required this.genre,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Ação do botão
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        genre,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
