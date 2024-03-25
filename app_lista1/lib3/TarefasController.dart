import 'package:flutter/material.dart';
import 'TarefasModel.dart';

class ListaTarefasWidget extends StatelessWidget {
  final ListaTarefasModel listaTarefasModel;

  ListaTarefasWidget(this.listaTarefasModel);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaTarefasModel.tarefas.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(listaTarefasModel.tarefas[index].descricao),
          leading: Checkbox(
            value: listaTarefasModel.tarefas[index].concluida,
            onChanged: (value) {
              listaTarefasModel.marcarComoConcluida(index);
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              listaTarefasModel.excluirTarefa(index);
            },
          ),
        );
      },
    );
  }
}

class ListaTarefasModel {
  get tarefas => null;

  void marcarComoConcluida(int index) {}

  void excluirTarefa(int index) {}

  void adicionarTarefa(String text) {}
}
