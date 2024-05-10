import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'TarefaController.dart';

class ListaTarefasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Nova Tarefa',
                suffixIcon: IconButton(
                  onPressed: () {
                    Provider.of<ListaTarefasController>(context, listen: false)
                        .adicionarTarefa(
                            context.read<TextEditingController>().text);
                    context.read<TextEditingController>().clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ListaTarefasController>(
              builder: (context, model, _) {
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.tarefas[index].descricao),
                      trailing: Checkbox(
                        value: model.tarefas[index].concluida,
                        onChanged: (value) {
                          model.marcarComoConcluida(index);
                        },
                      ),
                      onLongPress: () {
                        model.excluirTarefa(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
