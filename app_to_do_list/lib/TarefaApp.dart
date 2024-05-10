import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TarefaController.dart';
import 'TarefaView.dart';

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ListaTarefasController(),
        child: ListaTarefasScreen(),
      ),
    );
  }
}
