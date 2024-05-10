import 'package:app_lista1/TarefasController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista1/TarefasModel.dart';

class ListaTarefasScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

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
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nova Tarefa',
                suffixIcon: IconButton(
                  onPressed: () {
                    newMethod(context);
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ListaTarefasModel>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.tarefas[index].descricao),
                          Text(
                            'Data: ${model.tarefas[index].data}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
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

  void newMethod(BuildContext context) {
    Provider.of<ListaTarefasModel>(context, listen: false)
        .adicionarTarefa(_controller.text);
  }
}
