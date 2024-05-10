import 'package:app_carros/Controller.dart';
import 'package:app_carros/TelasListaCarro.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final ControllerCarros controllerCarros = ControllerCarros();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Carros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaListaCarros(controllerCarros),
    );
  }
}
