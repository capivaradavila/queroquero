import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_quero/financas/saldo_em_caixa/apresentacao/saldo_em_caixa_bloc.dart';
import 'package:quero_quero/financas/saldo_em_caixa/apresentacao/saldo_em_caixa.dart';
import 'package:quero_quero/financas/saldo_em_caixa/dominio/saldo_em_caixa_caso_de_uso.dart';

class SaldoEmCaixaFactory {
  Widget cria() {
    return BlocProvider(
      create: (context) {
        return SaldoEmCaixaBloc(
          casoDeUso: SaldoEmCaixaCasoDeUsoImpl(),
        );
      },
      child: const SaldoEmCaixa(),
    );
  }
}
