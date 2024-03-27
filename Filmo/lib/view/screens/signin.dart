import 'dart:js_interop';

import 'package:filmo/mixins/validations_mixin.dart';
import 'package:filmo/view/components/basic_btn_component.dart';
import 'package:filmo/view/components/logo_type_component.dart';
import 'package:filmo/view/components/text_input_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignInScreen extends StatelessWidget with ValidationsMixin {
  SignInScreen({super.key});
  final _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>;
  void entrar() {
    print('Botão "ENTRAR" pressionado');
  }

  void cadastrar() {
    print('Botão "ENTRAR" pressionado');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: LogoTypeComponent(),
            ),
            Form(
              child: Column(
                children: [
                  TextInputComponent(
                    controller: _emailController,
                    hintText: "E-mail",
                    validation: (val) => combine(
                      [
                        () => isNotEmpty(val),
                      ],
                    ),
                    prefixIcon: Icon(CupertinoIcons.add),
                  ),
                  BasicBtnComponent(btnText: "ENTRAR", onTap: entrar),
                  BasicBtnComponent(btnText: "CADASTRAR", onTap: cadastrar)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}