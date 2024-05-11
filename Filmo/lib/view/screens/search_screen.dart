import 'package:filmo/mixins/validations_mixin.dart';
//import 'package:filmo/view/components/basic_btn_component.dart';
//import 'package:filmo/view/components/logo_type_component.dart';
import 'package:filmo/view/components/text_input_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with ValidationsMixin {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void goBack() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 35.0),
          TextInputComponent(
            controller: _searchController,
            hintText: "Digite aqui...",
            maxLength: 50,
            validation: (val) => combine([
              () => isNotEmpty(val),
              //() => validateTextLength(val, 6)
            ]),
            prefixIcon: IconButton(
              icon: const Icon(CupertinoIcons.square_arrow_left),
              onPressed: goBack,
            ),
            sufixIcon: IconButton(
              icon: const Icon(CupertinoIcons.search),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
