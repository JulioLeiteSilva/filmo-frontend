import 'package:filmo/data/http/http_client.dart';
import 'package:filmo/data/models/login_model.dart';
import 'package:filmo/data/models/sign_up_model.dart';
import 'package:filmo/data/repositories/user_repository.dart';
import 'package:filmo/mixins/validations_mixin.dart';
import 'package:filmo/view/components/basic_btn_component.dart';
import 'package:filmo/view/components/logo_type_component.dart';
import 'package:filmo/view/components/text_input_component.dart';
import 'package:filmo/view/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with ValidationsMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final UserStore store = UserStore(
    repository: UserRepository(
      client: HttpClient(),
    ),
  );

  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    void entrar() {
      LoginModel loginModel = LoginModel(
          email: "fernandao123.teste@gmail.com", password: "senha123");
      store.signInUser(loginModel);
    }

    void goToSignUp() {
      GoRouter.of(context).push('/signup');
      // SignUpModel signUpModel = SignUpModel(
      //   name: "Teste",
      //   username: "TESTANDO",
      //   email: "teste@gmail.com",
      //   cellphone: "19984539218",
      //   password: "julio123",
      // );
      // store.signUpUser(signUpModel);
    }

    void showPassword() {
      setState(() {
        if (_passwordController.text.isNotEmpty)
          _isObscureText = !_isObscureText;
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
                      validation: isNotEmpty,
                    ),
                    const SizedBox(height: 150.0),
                    BasicBtnComponent(btnText: "ENTRAR", onTap: entrar),
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
