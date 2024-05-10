import 'package:flutter/material.dart';

void main() {
  runApp(ListaApp());
}

class ListaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      home: ListaTarefas(),
    );
  }
}

class ListaTarefas extends StatefulWidget {
  @override
  _ListaTarefasState createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  final List<String> _tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tarefas[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removerTarefa(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novaTarefa = await showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Adicionar Tarefa'),
                content: TextField(
                  decoration: InputDecoration(hintText: 'Digite a tarefa'),
                  onSubmitted: (texto) {
                    _adicionarTarefa(texto);
                    Navigator.of(context).pop(texto);
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                  ),
                ],
              );
            },
          );

          if (novaTarefa != null) {
            _adicionarTarefa(novaTarefa);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _adicionarTarefa(String tarefa) {
    setState(() {
      _tarefas.add(tarefa);
    });
  }

  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
    });
  }
}
