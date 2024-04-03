import 'package:filmo/view/components/option_btn_component.dart';
import 'package:filmo/view/components/tile_btn_component.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void test() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OptionBtnComponent(
            onTap: test,
            backgroundImageAsset: "assets/images/action.png",
          ),
          OptionBtnComponent(
            onTap: test,
            backgroundImageAsset: "assets/images/action.png",
          ),
        ],
      ),
    );
  }
}
