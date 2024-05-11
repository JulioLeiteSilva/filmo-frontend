import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchTileButton extends StatelessWidget {
  const SearchTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    void goToSearch() {
      GoRouter.of(context).push('/search');
    }

    return Container(
      color: Colors.black, // Fundo preto
      padding: const EdgeInsets.all(8.0), // Adicionando algum espaço interno
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Alinha os elementos ao redor
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 65,
            height: 65,
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: goToSearch,
            iconSize: 40,
            color: Colors.white, // Cor do ícone
          ),
        ],
      ),
    );
  }
}
