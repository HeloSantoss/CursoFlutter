import 'package:flutter/material.dart';
import 'package:lista_de_produtos/ProdutoModel.dart';

class ListaProdutoController extends ChangeNotifier {
  // Lista de produtos
  List<Produto> _produtos = [];
  // Getter para acessar a lista de produtos
  List<Produto> get produtos => _produtos;

  // Método para adicionar um novo produto à lista
  void adicionarProduto(String descricao, DateTime dataCompra, int quantidade) {
    if (descricao.trim().isNotEmpty) {
      _produtos.add(Produto(descricao.trim(), false, dataCompra, quantidade));
      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para marcar um produto como concluído com base no índice
  void marcarComoConcluido(int indice) {
    if (indice >= 0 && indice < _produtos.length) {
      _produtos[indice].concluida = !_produtos[indice].concluida; // faz a negação
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para excluir um produto com base no índice
  void excluirProduto(int indice) {
    if (indice >= 0 && indice < _produtos.length) {
      _produtos.removeAt(indice);
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }
}
