import 'package:filmo/data/services/auth_service.dart';
import 'package:filmo/mixins/validations_mixin.dart';
import 'package:filmo/view/components/horizontal_movie_list.dart';
import 'package:filmo/view/components/tile_btn_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:filmo/view/stores/user_store.dart';
import 'package:filmo/data/models/movie_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ValidationsMixin {
  void exit() {
    final authService = Provider.of<AuthService>(context, listen: false);
    final userStore = Provider.of<UserStore>(context, listen: false);

    authService.logout();
    GoRouter.of(context).push('/signin');
  }

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    final user = userStore.state.value;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
              ),
              Text(
                user?.name ?? "Usuário",
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 218, 218, 218)),
              ),
              const SizedBox(height: 10.0),
              TileBtnComponent(btnText: "SAIR", onTap: exit),
              const SizedBox(height: 30.0),
              if (user != null && user.myList.isNotEmpty)
                HorizontalMovieList(
                  listName: "MINHA LISTA",
                  movies: user.myList,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
