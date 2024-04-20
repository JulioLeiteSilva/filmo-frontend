import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchTileButton extends StatelessWidget {
  const SearchTileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Fundo preto
      padding: const EdgeInsets.all(8.0), // Adicionando algum espaço interno
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinha os elementos ao redor
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 65,
            height: 65,
          ),
          const Icon(
            CupertinoIcons.search,
            size: 40,
            color: Colors.white, // Cor do ícone
          ),
        ],
      ),
    );
  }
}
