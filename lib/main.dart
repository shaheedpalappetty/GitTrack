import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_track/bloc/fetch_bloc/fetch_bloc.dart';
import 'package:github_track/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchBloc(),
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: "Poppins",
            appBarTheme: const AppBarTheme(backgroundColor: Colors.black)),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
