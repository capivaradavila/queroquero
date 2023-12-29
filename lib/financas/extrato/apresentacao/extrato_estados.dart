import 'package:equatable/equatable.dart';

import '../dominio/extrato.dart';

sealed class ExtratoParaVisualizacao extends Equatable {
  @override
  List<Object> get props => [];
}

final class ExtratoCarregadoParaVisualizacao extends ExtratoParaVisualizacao {
  ExtratoCarregadoParaVisualizacao({
    required this.transacoes,
  });

  final List<TransacaoParaVisualizacao> transacoes;

  @override
  List<Object> get props => [transacoes];
}

class ExtratoCarregandoParaVisualizacao extends ExtratoParaVisualizacao {
  @override
  List<Object> get props => [];
}

class ExtratoNaoCarregadoParaVisualizacao extends ExtratoParaVisualizacao {
  @override
  List<Object> get props => [];
}

class ExtratoComErroParaVisualizacao extends ExtratoParaVisualizacao {
  @override
  List<Object> get props => [];
}

final class TransacaoParaVisualizacao extends Equatable {
  const TransacaoParaVisualizacao({
    required this.titulo,
    required this.descricao,
    required this.data,
    required this.valor,
    required this.tipo,
  });
  final String titulo;
  final String descricao;
  final String data;
  final String valor;
  final TransacaoTipo tipo;

  @override
  List<Object> get props => [];
}
