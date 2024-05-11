import 'package:filmo/data/http/http_client.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

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

  final UserStore store = UserStore(
    repository: UserRepository(
      client: HttpClient(),
    ),
  );

  bool _isObscureText = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void showPassword() {
      setState(() {
        if (_passwordController.text.isNotEmpty) {
          _isObscureText = !_isObscureText;
        }
      });
    }

    void next() {
      if (_formKey.currentState!.validate()) {
        SignUpModel signUpModel = SignUpModel(
          name: "Teste",
          username: "TESTANDO",
          email: "teste@gmail.com",
          cellphone: "19984539218",
          password: "julio123",
        );
        store.signUpUser(signUpModel);
        GoRouter.of(context).push("/preferences");
      }
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
                    validation: (val) => combine(
                      [() => isNotEmpty(val), () => validateTextLength(val, 3)],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextInputComponent(
                      controller: _userNameController,
                      maxLength: 30,
                      hintText: 'NOME DE USUÁRIO:',
                      prefixIcon: const Icon(CupertinoIcons.person_crop_circle),
                      validation: (val) => combine(
                        [
                          () => isNotEmpty(val),
                          () => validateTextLength(val, 5)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextInputComponent(
                      controller: _emailController,
                      maxLength: 50,
                      hintText: 'E-MAIL:',
                      prefixIcon: const Icon(CupertinoIcons.mail),
                      validation: (val) => combine(
                        [
                          () => isNotEmpty(val),
                          () => validateEmail(val),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextInputComponent(
                      controller: _celController,
                      maxLength: 16,
                      isPhoneNumber: true,
                      hintText: 'CELULAR:',
                      prefixIcon: const Icon(CupertinoIcons.phone),
                      validation: (val) => combine(
                        [
                          () => isNotEmpty(val),
                          () => validateCellphoneNumber(val),
                        ],
                      ),
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
                      validation: (val) => combine(
                        [
                          () => isNotEmpty(val),
                          () => validateTextLength(val, 6),
                        ],
                      ),
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
                      validation: (val) => combine(
                        [
                          () => isNotEmpty(val),
                          () => validateConfirmPassword(
                                _passwordController.value.text,
                                val,
                              ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: BasicBtnComponent(btnText: 'CONTINUAR', onTap: next),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: BasicBtnComponent(
                        btnText: 'VOLTAR',
                        onTap: () => GoRouter.of(context).push("/signin")),
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
