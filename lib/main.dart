import 'package:dorminhoco/notification.dart';
import 'package:dorminhoco/interface.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Numb(),
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.blue, elevation: 10),
            backgroundColor: Colors.white,
            cardColor: Colors.blue,
            shadowColor: Colors.black54),
        darkTheme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.black,
              elevation: 10,
            ),
            backgroundColor: Colors.black87,
            shadowColor: Colors.black38,
            buttonColor: Colors.blueGrey,
            cardColor: Colors.blue));
  }
}
