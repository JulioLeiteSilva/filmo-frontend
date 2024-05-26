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
      color: Colors.black,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
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
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
