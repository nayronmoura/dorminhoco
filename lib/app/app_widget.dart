import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Modular.setInitialRoute('/per_time');
    return MaterialApp.router(
      title: 'Dorminhoco',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.blue, elevation: 10),
          backgroundColor: Colors.white,
          cardColor: Colors.blue,
          shadowColor: Colors.black54),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.black,
            elevation: 10,
          ),
          backgroundColor: Colors.black87,
          shadowColor: Colors.black38,
          cardColor: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
