import 'package:flutter/material.dart';
import 'package:to_do_list/ListaController.dart';

class ListaView extends StatelessWidget {
  final ListaController controller;

  ListaView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.tarefas.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(controller.tarefas[index]),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => controller.removerTarefa(index),
          ),
        );
      },
    );
  }
}
