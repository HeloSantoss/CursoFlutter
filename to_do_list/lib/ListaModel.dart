import 'package:flutter/foundation.dart';

class ListaModel {
  final String titulo;
  final bool concluida;

  ListaModel({
    required this.titulo,
    this.concluida = false,
  });

  @override
  String toString() {
    return 'ListaModel(titulo: $titulo, concluida: $concluida)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListaModel &&
        other.titulo == titulo &&
        other.concluida == concluida;
  }

  @override
  int get hashCode {
    return titulo.hashCode ^ concluida.hashCode;
  }
}
