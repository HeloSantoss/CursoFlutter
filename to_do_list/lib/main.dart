import 'package:flutter/material.dart';
import 'package:to_do_list/ListaController.dart';
import 'package:to_do_list/ListaView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ListaController listaController = ListaController();

    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Tarefas'),
        ),
        body: ListaView(controller: listaController),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Adicione uma nova tarefa ao pressionar o botão
            listaController.adicionarTarefa('Nova Tarefa');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
