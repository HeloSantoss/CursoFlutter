import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Lista de informações fictícias
  final List<String> _itemList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listagem Dinâmica'),
        ),
        body: ListView.builder(
          itemCount: _itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text((index + 1).toString()), // Exibe o número do item
                ),
                title: Text(_itemList[index]), // Exibe o nome do item
                subtitle: Text('Descrição do item ${index + 1}'), // Descrição fictícia
                onTap: () {
                  // Ação ao clicar no item
                  print('Item ${index + 1} clicado');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
