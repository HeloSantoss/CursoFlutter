import 'package:app_carros/Controller.dart';
import 'package:app_carros/Model.dart';
import 'package:app_carros/TelaDetalheCarros.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TelaDetalheCarro extends StatelessWidget {
  final Carro carro;

  TelaDetalheCarro(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Carro"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(carro.imagemUrl),
            SizedBox(height: 20),
            Text("Modelo: ${carro.modelo}"),
            Text("Ano: ${carro.ano}"),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final CarroController controllerCarros = CarroController();

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

  static CarroController() {}
}

class CarroController {
  get listarCarros => null;
}
