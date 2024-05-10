import 'package:exemplo_json/Model/produtos_model.dart';
import 'package:flutter/material.dart';

class ProdutosInfoScreen extends StatelessWidget {
  Produto info;
  ProdutosInfoScreen({required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Produto: ${info.nome}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Image.asset(info.foto),
            Text(info.nome),
            Text(info.categoria),
            Text('${info.valor}'),
          ],
        ),
      ),
    );
  }
}
