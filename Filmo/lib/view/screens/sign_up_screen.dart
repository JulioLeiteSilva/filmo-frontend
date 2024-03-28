import 'package:filmo/mixins/validations_mixin.dart';
import 'package:filmo/view/components/basic_btn_component.dart';
import 'package:filmo/view/components/logo_type_component.dart';
import 'package:filmo/view/components/text_input_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignUpScreen extends StatelessWidget with ValidationsMixin {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _celController = TextEditingController();
    final _userNameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _passwordCheckController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    void teste() {
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoTypeComponent(),
                const SizedBox(height: 4.0),
                Text('.'),
                const SizedBox(height: 5),
                TextInputComponent(
                    controller: _nameController,
                    hintText: 'insira o seu nome',
                    prefixIcon: const Icon(CupertinoIcons.person_crop_circle),
                    validation: isNotEmpty),
                const SizedBox(height: 5),
                TextInputComponent(
                    controller: _userNameController,
                    hintText: 'insira o seu nome de usuario',
                    prefixIcon: const Icon(CupertinoIcons.person_crop_circle),
                    validation: isNotEmpty),
                const SizedBox(height: 5),
                TextInputComponent(
                  controller: _emailController,
                  hintText: 'insira o seu email',
                  prefixIcon: const Icon(CupertinoIcons.mail),
                  validation: isNotEmpty,
                ),
                const SizedBox(height: 5),
                TextInputComponent(
                    controller: _celController,
                    hintText: 'insira o seu telefone',
                    prefixIcon: const Icon(CupertinoIcons.phone),
                    validation: isNotEmpty),
                const SizedBox(height: 5),
                TextInputComponent(
                    controller: _passwordController,
                    hintText: 'insira a sua senha',
                    isObscureText: true,
                    prefixIcon: const Icon(CupertinoIcons.lock_fill),
                    sufixIcon: IconButton(
                        icon: const Icon(CupertinoIcons.eye_fill),
                        onPressed: teste),
                    validation: isNotEmpty),
                const SizedBox(height: 5),
                TextInputComponent(
                    controller: _passwordCheckController,
                    hintText: 'confirme a sua senha',
                    isObscureText: true,
                    prefixIcon: const Icon(CupertinoIcons.lock_fill),
                    sufixIcon: IconButton(
                        icon: const Icon(CupertinoIcons.eye_fill),
                        onPressed: teste),
                    validation: isNotEmpty),
                const SizedBox(height: 5),
                BasicBtnComponent(btnText: 'CONTINUAR', onTap: teste),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
