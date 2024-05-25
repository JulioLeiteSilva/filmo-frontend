import 'package:filmo/data/http/http_client.dart';
import 'package:filmo/data/models/login_model.dart';
import 'package:filmo/mixins/validations_mixin.dart';
import 'package:filmo/view/components/basic_btn_component.dart';
import 'package:filmo/view/components/logo_type_component.dart';
import 'package:filmo/view/components/text_input_component.dart';
import 'package:filmo/view/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with ValidationsMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    void loginUser() {
      if (_formKey.currentState!.validate()) {
        LoginModel loginModel = LoginModel(
            email: _emailController.text, password: _passwordController.text);
        userStore.signInUser(loginModel);
        authService.login();
      }
    }

    void goToSignUp() {
      GoRouter.of(context).push('/signup');
    }

    void showPassword() {
      setState(() {
        if (_passwordController.text.isNotEmpty) {
          _isObscureText = !_isObscureText;
        }
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(52.0),
                child: LogoTypeComponent(),
              ),
              const SizedBox(height: 100.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextInputComponent(
                      controller: _emailController,
                      hintText: "E-mail",
                      maxLength: 50,
                      prefixIcon: const Icon(CupertinoIcons.mail),
                      validation: (val) => combine(
                        [
                          () => isNotEmpty(val),
                          () => validateEmail(val),
                        ],
                      ),
                    ),
                    TextInputComponent(
                      controller: _passwordController,
                      hintText: "Senha",
                      maxLength: 15,
                      prefixIcon: const Icon(CupertinoIcons.lock_fill),
                      sufixIcon: IconButton(
                        icon: Icon(_isObscureText
                            ? CupertinoIcons.eye_slash_fill
                            : CupertinoIcons.eye_fill),
                        onPressed: showPassword,
                      ),
                      isObscureText: _isObscureText,
                      validation: (val) => combine([
                        () => isNotEmpty(val),
                        () => validateTextLength(val, 6)
                      ]),
                    ),
                    const SizedBox(height: 150.0),
                    BasicBtnComponent(btnText: "ENTRAR", onTap: loginUser),
                    ValueListenableBuilder<bool>(
                      valueListenable: userStore.isLoading,
                      builder: (context, isLoading, child) {
                        if (isLoading) {
                          return CircularProgressIndicator();
                        }
                        return Container();
                      },
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: userStore.error,
                      builder: (context, error, child) {
                        if (error.isNotEmpty) {
                          return Text(error,
                              style: TextStyle(color: Colors.red));
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              BasicBtnComponent(btnText: "CADASTRAR", onTap: goToSignUp),
            ],
          ),
        ),
      ),
    );
  }
}
