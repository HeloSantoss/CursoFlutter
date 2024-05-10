class ContatoModel {
  //atributos
  int id;
  String nome;
  String email;
  String telefone;
  String endereco;
  String senha;
  String rg;
  //construtor
  ContatoModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.senha,
    required this.rg,
  });
  //mapeamento
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'rg': rg,
      'senha': senha,
    };
  }

  factory ContatoModel.fromMap(Map<String, dynamic> map) {
    return ContatoModel(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      rg: map['rg'],
      senha: map['senha'],
    );
  }
}
