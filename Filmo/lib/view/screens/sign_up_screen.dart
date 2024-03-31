import 'package:filmo/mixins/validations_mixin.dart';
import 'package:filmo/view/components/basic_btn_component.dart';
import 'package:filmo/view/components/logo_type_component.dart';
import 'package:filmo/view/components/text_input_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ValidationsMixin {
  final _nameController = TextEditingController();
  final _celController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();
  bool _isObscureText = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void showPassword() {
      setState(() {
        if (_passwordController.text.isNotEmpty)
          _isObscureText = !_isObscureText;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(35.0),
                    child: LogoTypeComponent(),
                  ),
                  TextInputComponent(
                    controller: _nameController,
                    maxLength: 30,
                    hintText: 'NOME:',
                    prefixIcon: const Icon(CupertinoIcons.person_crop_circle),
                    validation: isNotEmpty,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextInputComponent(
                      controller: _userNameController,
                      maxLength: 30,
                      hintText: 'NOME DE USUÁRIO:',
                      prefixIcon: const Icon(CupertinoIcons.person_crop_circle),
                      validation: isNotEmpty,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextInputComponent(
                      controller: _emailController,
                      maxLength: 50,
                      hintText: 'E-MAIL:',
                      prefixIcon: const Icon(CupertinoIcons.mail),
                      validation: isNotEmpty,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextInputComponent(
                      controller: _celController,
                      maxLength: 16,
                      hintText: 'CELULAR:',
                      prefixIcon: const Icon(CupertinoIcons.phone),
                      validation: isNotEmpty,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextInputComponent(
                      controller: _passwordController,
                      maxLength: 15,
                      hintText: 'SENHA:',
                      isObscureText: _isObscureText,
                      prefixIcon: const Icon(CupertinoIcons.lock_fill),
                      sufixIcon: IconButton(
                        icon: Icon(_isObscureText
                            ? CupertinoIcons.eye_slash_fill
                            : CupertinoIcons.eye_fill),
                        onPressed: showPassword,
                      ),
                      validation: isNotEmpty,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextInputComponent(
                      controller: _passwordCheckController,
                      maxLength: 15,
                      hintText: 'CONFIRME SUA SENHA:',
                      isObscureText: _isObscureText,
                      prefixIcon: const Icon(CupertinoIcons.lock_fill),
                      sufixIcon: IconButton(
                        icon: Icon(_isObscureText
                            ? CupertinoIcons.eye_slash_fill
                            : CupertinoIcons.eye_fill),
                        onPressed: showPassword,
                      ),
                      validation: isNotEmpty,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: BasicBtnComponent(
                        btnText: 'CONTINUAR', onTap: showPassword),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: BasicBtnComponent(
                        btnText: 'VOLTAR', onTap: showPassword),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
