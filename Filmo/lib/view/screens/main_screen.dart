import 'package:filmo/view/screens/home_screen.dart';
import 'package:filmo/view/screens/profile_screen.dart';
import 'package:filmo/view/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentScreen = 0;
  late PageController pc;
  void setCurrentScreen(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setCurrentScreen,
        children: [
          const HomeScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
        onTap: (index) {
          pc.animateToPage(
            index,
            duration: const Duration(microseconds: 400),
            curve: Curves.easeIn,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        fixedColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
    );
  }
}
