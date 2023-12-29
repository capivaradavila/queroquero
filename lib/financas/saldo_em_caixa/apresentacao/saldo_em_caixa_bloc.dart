import 'package:flutter_bloc/flutter_bloc.dart';

import '../dominio/saldo_em_caixa_caso_de_uso.dart';
import '../dominio/saldo_em_caixa_modelo.dart';
import 'saldo_em_caixa_estados.dart';
import 'saldo_em_caixa_eventos.dart';

final class SaldoEmCaixaBloc extends Bloc<SaldoEmCaixaEvento, SaldoEmCaixaEstado> {
  SaldoEmCaixaBloc({
    required SaldoEmCaixaCasoDeUso casoDeUso,
  })  : _casoDeUso = casoDeUso,
        super(SaldoEmCaixaEstadoInicial()) {
    on<CarregaSaldoEmCaixa>(_onCarregaSaldo);
  }

  final SaldoEmCaixaCasoDeUso _casoDeUso;

  void _onCarregaSaldo(
    SaldoEmCaixaEvento event,
    Emitter<SaldoEmCaixaEstado> emit,
  ) {
    _casoDeUso.carregaSaldo().then((saldo) {
      emit(
        SaldoEmCaixaEstadoCarregado(
          valor: 'R\$ ${saldo.valor}',
          status: SaldoEmCaixaStatus.bom,
        ),
      );
    }).catchError((error) {
      emit(SaldoEmCaixaEstadoErro());
    });
  }
}
