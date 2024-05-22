import 'package:filmo/routes.dart';
import 'package:filmo/theme/dark_theme.dart';
import 'package:filmo/view/screens/preferences_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilmoApp extends StatelessWidget {
  const FilmoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      darkTheme: darkTheme,
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
