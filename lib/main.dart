import 'package:flutter/material.dart';
import 'package:github_issues/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Poppins",
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
