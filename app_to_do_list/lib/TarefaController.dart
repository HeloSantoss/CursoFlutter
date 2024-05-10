import 'package:flutter/material.dart';
import 'package:app_to_do_list/TarefaModel.dart';

class ListaTarefasController extends ChangeNotifier {
  List<Tarefa> _tarefas = [];
  List<Tarefa> get tarefas => _tarefas;

  void adicionarTarefa(String descricao) {
    if (descricao.trim().isNotEmpty) {
      _tarefas.add(Tarefa(descricao.trim(), false));
      notifyListeners();
    }
  }

  void alternarConclusao(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = !_tarefas[indice].concluida;
      notifyListeners();
    }
  }

  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }

  void selecionarTodasAsTarefas() {
    for (var tarefa in _tarefas) {
      tarefa.selecionada = true;
    }
    notifyListeners();
  }

  void deselecionarTodasAsTarefas() {
    for (var tarefa in _tarefas) {
      tarefa.selecionada = false;
    }
    notifyListeners();
  }

  void excluirTarefasSelecionadas() {
    _tarefas.removeWhere((tarefa) => tarefa.selecionada);
    notifyListeners();
  }

  IconData get iconeLixeira {
    bool algumaTarefaSelecionada = _tarefas.any((tarefa) => tarefa.selecionada);
    return algumaTarefaSelecionada ? Icons.delete : Icons.delete_outline;
  }

  void marcarComoConcluida(int index) {
    if (index >= 0 && index < _tarefas.length) {
      _tarefas[index].concluida = true;
      notifyListeners();
    }
  }
}
