import 'package:flutter/material.dart';
import 'package:lista_de_produtos/ProdutoController.dart'; // Importa o controlador de produtos
import 'package:provider/provider.dart'; // Importa o pacote Provider

class ListaProdutoScreen extends StatelessWidget {
  // Controlador para o campo de texto de novo produto
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar novo produto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Novo Produto',
                // Ícone para adicionar produto ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarProduto do Provider para atualizar o estado
                    Provider.of<ListaProdutoController>(context, listen: false) .adicionarProduto(_controller.text); // Adicionando o texto do campo como argumento
                    // Limpar o campo de texto após adicionar o produto
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de produtos usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaProdutoController>( // Consumer é usado para ouvir mudanças no estado do controlador de produtos
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.produtos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto do produto
                      title: Text(model.produtos[index].descricao),
                      // Checkbox para marcar o produto como concluído
                      trailing: Checkbox(
                        value: model.produtos[index].concluida,
                        onChanged: (value) {
                          // Chamando o método marcarComoConcluido do Provider para atualizar o estado
                          model.marcarComoConcluido(index);
                        },
                      ),
                      // Exclui o produto ao manter pressionado
                      onLongPress: () {
                        // Chamando o método excluirProduto do Provider para atualizar o estado
                        model.excluirProduto(index);
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
}
