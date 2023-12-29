class Extrato {
  const Extrato({
    required this.transacoes,
  });

  final List<Transacao> transacoes;
}

class Transacao {
  const Transacao({
    required this.valor,
    required this.tipo,
    required this.data,
  });
  final int valor;
  final DateTime data;
  final TransacaoTipo tipo;
}

enum TransacaoTipo { entrada, saida }
