import 'package:equatable/equatable.dart';

import '../dominio/saldo_em_caixa_modelo.dart';

sealed class SaldoEmCaixaEstado extends Equatable {
  @override
  List<Object> get props => [];
}

final class SaldoEmCaixaEstadoCarregado extends SaldoEmCaixaEstado {
  SaldoEmCaixaEstadoCarregado({
    required this.valor,
    required this.status,
  });
  final String valor;
  final SaldoEmCaixaStatus status;

  @override
  List<Object> get props => [valor, status];
}

class SaldoEmCaixaEstadoInicial extends SaldoEmCaixaEstado {
  @override
  List<Object> get props => [];
}

class SaldoEmCaixaEstadoCarregando extends SaldoEmCaixaEstado {
  @override
  List<Object> get props => [];
}

class SaldoEmCaixaEstadoErro extends SaldoEmCaixaEstado {
  @override
  List<Object> get props => [];
}
