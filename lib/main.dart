import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 3, 37, 65),
        ),
      ),
      home: AuthWidget(),
    );
  }
}
