import 'package:flutter/material.dart';

class ListaController extends ChangeNotifier {
  final List<String> _tarefas = [];

  List<String> get tarefas => _tarefas;

  void adicionarTarefa(String tarefa) {
    _tarefas.add(tarefa);
  }

  void removerTarefa(int index) {
    _tarefas.removeAt(index);
  }
}
