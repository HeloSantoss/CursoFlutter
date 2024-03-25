class Tarefa {
  String descricao;
  bool concluida;

  // Construtor da classe Tarefa
  Tarefa(this.descricao, this.concluida);

  // Método para marcar a tarefa como concluída
  void marcarConcluida() {
    concluida = true;
  }

  // Método para marcar a tarefa como não concluída
  void marcarNaoConcluida() {
    concluida = false;
  }

  @override
  String toString() {
    return 'Tarefa: descricao=$descricao, concluida=$concluida';
  }
}
