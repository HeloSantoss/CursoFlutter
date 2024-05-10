import 'package:flutter/material.dart';
import 'package:app_lista1/TarefasModel.dart';
import 'package:provider/provider.dart';

class ListaTarefasModel extends ChangeNotifier {
  List<List<Tarefa>> _tarefasPorCategoria = [];

  List<List<Tarefa>> get tarefasPorCategoria => _tarefasPorCategoria;

  List<Tarefa> get tarefas {
    List<Tarefa> allTasks = [];
    _tarefasPorCategoria.forEach((categoria) {
      allTasks.addAll(categoria);
    });
    return allTasks;
  }

  void adicionarTarefa(String descricao, String categoria) {
    DateTime dataAtual = DateTime.now();
    String dataFormatada = "${dataAtual.day}/${dataAtual.month}/${dataAtual.year}";
    int indiceCategoria = _tarefasPorCategoria.indexWhere((lista) => lista.first.categoria == categoria);

    if (indiceCategoria == -1) {
      _tarefasPorCategoria.add([Tarefa(descricao, false, dataFormatada, categoria)]);
    } else {
      _tarefasPorCategoria[indiceCategoria].add(Tarefa(descricao, false, dataFormatada, categoria));
    }

    notifyListeners();
  }

  void marcarComoConcluida(int indiceCategoria, int indiceTarefa) {
    if (indiceCategoria >= 0 && indiceCategoria < _tarefasPorCategoria.length &&
        indiceTarefa >= 0 && indiceTarefa < _tarefasPorCategoria[indiceCategoria].length) {
      _tarefasPorCategoria[indiceCategoria][indiceTarefa].concluida = true;
      notifyListeners();
    }
  }

  void excluirTarefa(int indiceCategoria, int indiceTarefa) {
    if (indiceCategoria >= 0 && indiceCategoria < _tarefasPorCategoria.length &&
        indiceTarefa >= 0 && indiceTarefa < _tarefasPorCategoria[indiceCategoria].length) {
      _tarefasPorCategoria[indiceCategoria].removeAt(indiceTarefa);
      notifyListeners();
    }
  }

  void excluirConcluidas() {
    for (var lista in _tarefasPorCategoria) {
      lista.removeWhere((tarefa) => tarefa.concluida);
    }
    notifyListeners();
  }

  IconData get iconeExcluir {
    bool algumaTarefaSelecionada = _tarefasPorCategoria.any((lista) => lista.any((tarefa) => tarefa.selecionada));
    return algumaTarefaSelecionada ? Icons.delete : Icons.delete_outline;
  }
  
  void editarTarefa(int indiceCategoria, int indiceTarefa, String novaDescricao) {}
}

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
                    adicionarNovaTarefa(context);
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
                          model.marcarComoConcluida(index ~/ 100, index % 100);
                        },
                      ),
                      onLongPress: () {
                        model.excluirTarefa(index ~/ 100, index % 100);
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

  void adicionarNovaTarefa(BuildContext context) {
    Provider.of<ListaTarefasModel>(context, listen: false)
        .adicionarTarefa(_controller.text, 'Categoria'); // Substitua 'Categoria' pela categoria desejada
  }

  void editarTarefa(BuildContext context, int indiceCategoria, int indiceTarefa, String novaDescricao) {
    Provider.of<ListaTarefasModel>(context, listen: false)
        .editarTarefa(indiceCategoria, indiceTarefa, novaDescricao);
  }
}
