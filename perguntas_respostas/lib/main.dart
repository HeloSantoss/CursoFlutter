import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Tarefa {
  final String descricao;
  final String categoria;
  final DateTime dataAdicao;
  bool concluida;

  Tarefa(this.descricao, this.categoria, this.dataAdicao,
      {this.concluida = false});
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerTarefa = TextEditingController();
  TextEditingController _controllerCategoria = TextEditingController();
  List<Tarefa> _tarefas = [];
  String _resultado = '';

  void _adicionarTarefa() {
    String novaTarefa = _controllerTarefa.text.trim();
    String novaCategoria = _controllerCategoria.text.trim();
    DateTime dataAtual = DateTime.now();

    if (novaTarefa.isNotEmpty) {
      setState(() {
        _tarefas.add(Tarefa(novaTarefa, novaCategoria, dataAtual));
      });
      _controllerTarefa.clear();
      _controllerCategoria.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, insira uma tarefa válida.'),
        ),
      );
    }
  }

  Future<void> _atualizarTarefas() async {
    // Simulando uma operação assíncrona
    await Future.delayed(Duration(seconds: 1));
    // Atualizando a lista de tarefas
    setState(() {});
  }

  void _editarTarefa(int index) {
    Tarefa editedTarefa = _tarefas[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _controllerEditedTarefa =
            TextEditingController(text: editedTarefa.descricao);
        TextEditingController _controllerEditedCategoria =
            TextEditingController(text: editedTarefa.categoria);

        return AlertDialog(
          title: Text('Editar Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controllerEditedTarefa,
                decoration: InputDecoration(labelText: 'Tarefa'),
              ),
              TextField(
                controller: _controllerEditedCategoria,
                decoration: InputDecoration(labelText: 'Categoria'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                String newTarefa = _controllerEditedTarefa.text.trim();
                String newCategoria = _controllerEditedCategoria.text.trim();

                if (newTarefa.isNotEmpty) {
                  setState(() {
                    _tarefas[index] = Tarefa(
                      newTarefa,
                      newCategoria,
                      _tarefas[index].dataAdicao,
                      concluida: _tarefas[index].concluida,
                    );
                  });
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Por favor, insira uma tarefa válida.'),
                    ),
                  );
                }
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _tarefas.sort((a, b) => a.categoria.compareTo(b.categoria));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(
              color: Colors.blue), // Definindo a cor azul para o título
        ),
        centerTitle: true, // Centralizando o título
      ),
      body: RefreshIndicator(
        onRefresh: _atualizarTarefas,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controllerTarefa,
                      decoration: InputDecoration(labelText: 'Nova Tarefa'),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: _adicionarTarefa,
                    child: Text('Adicionar Tarefa'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .blue, // Definindo a cor de fundo do botão como azul
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _controllerCategoria,
                decoration: InputDecoration(labelText: 'Categoria'),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: Container(
                  // Definindo a cor de fundo azul para a lista de tarefas
                  // color: Color.fromARGB(255, 228, 226, 137),
                  child: ListView.builder(
                    itemCount: _tarefas.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue), // Adicionando uma borda azul
                          borderRadius: BorderRadius.circular(
                              8.0), // Arredondando as bordas
                        ),
                        child: Dismissible(
                          key: Key(_tarefas[index].descricao),
                          onDismissed: (direction) {
                            setState(() {
                              _tarefas.removeAt(index);
                            });
                          },
                          background: Container(
                            color: Color.fromARGB(255, 201, 62, 166),
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              _tarefas[index].descricao,
                              style: TextStyle(
                                color: _tarefas[index].concluida
                                    ? Colors.blueGrey
                                    : Colors
                                        .black, // Alterando a cor do texto com base na conclusão
                                decoration: _tarefas[index].concluida
                                    ? TextDecoration.lineThrough
                                    : TextDecoration
                                        .none, // Adicionando uma linha através do texto se estiver concluído
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Categoria: ${_tarefas[index].categoria}',
                                  style: TextStyle(
                                    color: _tarefas[index].concluida
                                        ? Colors.blueGrey
                                        : Colors
                                            .black, // Alterando a cor do texto com base na conclusão
                                  ),
                                ),
                                Text(
                                  'Data de Adição: ${_tarefas[index].dataAdicao.toString()}',
                                  style: TextStyle(
                                    color: _tarefas[index].concluida
                                        ? Colors.blueGrey
                                        : Colors
                                            .black, // Alterando a cor do texto com base na conclusão
                                  ),
                                ),
                              ],
                            ),
                            trailing: Checkbox(
                              value: _tarefas[index].concluida,
                              onChanged: (value) {
                                setState(() {
                                  _tarefas[index].concluida = value!;
                                });
                              },
                            ),
                            onTap: () => _editarTarefa(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
