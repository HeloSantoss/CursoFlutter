import 'package:flutter/material.dart';

void main() {
  runApp(TarefasApp());
}

class TarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListaTarefasPage(),
    );
  }
}

class Tarefa {
  String nome;
  String categoria;
  bool concluido;
  String data;

  Tarefa(this.nome, this.categoria,
      {this.concluido = false, required this.data});
}

class ListaTarefasPage extends StatefulWidget {
  @override
  _ListaTarefasPageState createState() => _ListaTarefasPageState();
}

class _ListaTarefasPageState extends State<ListaTarefasPage> {
  List<Tarefa> _tarefas = [];
  TextEditingController _controller = TextEditingController();
  TextEditingController _categoriaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 50, 236),
        title: Text('Lista de Mercado'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(_tarefas[index].nome),
                  onDismissed: (direction) {
                    setState(() {
                      _tarefas.removeAt(index);
                    });
                  },
                  background: Container(
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                  ),
                  child: CheckboxListTile(
                    title: Text(_tarefas[index].nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_tarefas[index].categoria),
                        Text(_tarefas[index].data),
                      ],
                    ),
                    value: _tarefas[index].concluido,
                    onChanged: (value) {
                      setState(() {
                        _tarefas[index].concluido = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    secondary: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _editarTarefa(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Adicionar tarefa',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _adicionarTarefa();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _categoriaController,
                        decoration: InputDecoration(
                          hintText: 'Categoria',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _adicionarTarefa() {
    String novaTarefa = _controller.text.trim();
    String categoria = _categoriaController.text.trim();
    if (novaTarefa.isNotEmpty &&
        !_tarefas.any((tarefa) => tarefa.nome == novaTarefa)) {
      DateTime dataAtual = DateTime.now();
      String dataFormatada =
          '${dataAtual.day}/${dataAtual.month}/${dataAtual.year}';
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmar'),
            content: Text('Deseja realmente adicionar esta tarefa?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _tarefas.add(
                        Tarefa(novaTarefa, categoria, data: dataFormatada));
                    _controller.clear();
                    _categoriaController.clear();
                  });
                },
                child: Text('Sim'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar'),
              ),
            ],
          );
        },
      );
    }
  }

  void _editarTarefa(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar'),
          content: Text('Deseja realmente editar esta tarefa?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Editar Tarefa'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: TextEditingController(
                                text: _tarefas[index].nome),
                            onChanged: (value) {
                              setState(() {
                                _tarefas[index].nome = value;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'Novo nome da tarefa'),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: TextEditingController(
                                text: _tarefas[index].categoria),
                            onChanged: (value) {
                              setState(() {
                                _tarefas[index].categoria = value;
                              });
                            },
                            decoration:
                                InputDecoration(hintText: 'Nova categoria'),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Salvar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Sim'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _categoriaController.dispose();
    super.dispose();
  }
}
