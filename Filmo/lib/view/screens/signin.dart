import 'package:filmo/mixins/validations_mixin.dart';
import 'package:filmo/view/components/basic_btn_component.dart';
import 'package:filmo/view/components/logo_type_component.dart';
import 'package:filmo/view/components/text_input_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignInScreen extends StatelessWidget with ValidationsMixin {
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  void entrar() {}
  void cadastrar() {}

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
                const SizedBox(height: 120.0),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LogoTypeComponent(),
               ),
            Form(
              child: Column(
                children: [
                  const SizedBox(height: 50.0),
                  TextInputComponent(
                    controller: _emailController,
                    hintText: "E-mail",
                    prefixIcon: const Icon(CupertinoIcons.mail),
                    validation: (val) => combine(
                      [() => isNotEmpty(val),],
                    ),
                  ),

                  TextInputComponent(
                    controller: _passwordController,
                    hintText: "Senha",
                    prefixIcon: const Icon(CupertinoIcons.lock_fill),
                    sufixIcon: IconButton(
                        icon: const Icon(CupertinoIcons.eye_fill),
                        onPressed: teste),
                        isObscureText: true,
                    validation: isNotEmpty),
                  
                  BasicBtnComponent(btnText: "ENTRAR", onTap: entrar),
                  const SizedBox(height: 20.0),
                  BasicBtnComponent(btnText: "CADASTRAR", onTap: cadastrar)
                   ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}