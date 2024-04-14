import 'package:filmo/mixins/validations_mixin.dart';
import 'package:filmo/view/components/basic_btn_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ValidationsMixin {

  @override
    void avaliacoes() {}
    void sair() {}

    Widget build(BuildContext context) {
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
                backgroundImage: AssetImage('assets/images/profile.png'),
               ),
              ),
              const Text(
                "Sabrina Carpenter",
                style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 218, 218, 218)),
               ),
              SizedBox(height: 55.0),
              BasicBtnComponent(btnText: "MINHAS AVALIAÇÕES", onTap: avaliacoes),
              const SizedBox(height: 30.0),
              BasicBtnComponent(btnText: "SAIR", onTap: sair),
            ],
          ),
        )
      ),
      bottomNavigationBar: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
            ),
          ],
          selectedItemColor: Color.fromARGB(255, 219, 173, 72),
        ),
      ),
    );
  }
}