class Produto {
  //atributos
  final String nome;
  final double valor;
  final String categoria;
  final String foto;
  //construtor
  Produto({required this.nome, required this.valor, required this.categoria, required this.foto});

  //métodos(toJson e fromJson)
  Map<String, dynamic> toJson() =>
      {'nome': nome, 'preco': valor, 'categoria': categoria, 'foto': foto};

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      valor: json['preco'],
      categoria: json['categoria'],
      foto: json['foto']
    );
  }
}
