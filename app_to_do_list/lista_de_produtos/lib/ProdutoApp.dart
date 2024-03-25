import 'package:flutter/material.dart';
import 'package:lista_de_produtos/ProdutoController.dart';
import 'package:provider/provider.dart';

class ListaProdutoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a tela inicial como a ListaProdutoScreen e utilizando o Provider
      home: ChangeNotifierProvider(
        create: (context) => ListaProdutoController(),
        child: ListaProdutoScreen(), // Corrigido para ListaProdutoScreen
      ),
    );
  }
}

class ListaProdutoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: Consumer<ListaProdutoController>(
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.produtos.length,
            itemBuilder: (context, index) {
              var produto = model.produtos[index];
              return ListTile(
                title: Text(produto.descricao),
                subtitle: Text('Data da Compra: ${produto.dataCompra}\nQuantidade: ${produto.quantidade}'),
                trailing: Checkbox(
                  value: produto.concluida,
                  onChanged: (value) {
                    model.marcarComoConcluido(index);
                  },
                ),
                onLongPress: () {
                  model.excluirProduto(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
