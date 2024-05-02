import 'package:filmo/view/components/basic_btn_component.dart';
import 'package:filmo/view/components/option_btn_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  void teste() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              OptionBtnComponent(
                  onTap: teste,
                  backgroundImageAsset: 'assets/images/btn_action.png'),
              OptionBtnComponent(
                  onTap: teste,
                  backgroundImageAsset: 'assets/images/btn_animation.png'),
              OptionBtnComponent(
                  onTap: teste,
                  backgroundImageAsset: 'assets/images/btn_comedy.png'),
              OptionBtnComponent(
                  onTap: teste,
                  backgroundImageAsset: 'assets/images/btn_crime.png'),
              OptionBtnComponent(
                  onTap: teste,
                  backgroundImageAsset: 'assets/images/btn_fantasy.png'),
              OptionBtnComponent(
                  onTap: teste,
                  backgroundImageAsset: 'assets/images/btn_ficcion.png'),
              OptionBtnComponent(
                  onTap: teste,
                  backgroundImageAsset: 'assets/images/btn_horror.png'),
              OptionBtnComponent(
                  onTap: teste,
                  backgroundImageAsset: 'assets/images/btn_musical.png'),
              OptionBtnComponent(
                  onTap: teste,
                  backgroundImageAsset: 'assets/images/btn_romance.png'),
              OptionBtnComponent(
                  onTap: teste,
                  backgroundImageAsset: 'assets/images/btn_suspense.png'),
              BasicBtnComponent(btnText: 'FINALIZAR', onTap: teste)
            ],
          ),
        ),
      ),
    );
  }
}
