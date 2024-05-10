import 'package:flutter/material.dart';
import 'package:projeto_json/View/filme_cadastro_view.dart';
import 'package:projeto_json/View/filme_list_view.dart';

import 'View/home_screen_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto Json",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home' :(context) => HomeScreen(),
        '/list':(context) => FilmesListScreen(),
        '/cadastro':(context) => FilmeCadastroScreen()
      } ,
    );
  }
}