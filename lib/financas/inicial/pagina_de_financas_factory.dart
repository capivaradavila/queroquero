import 'package:flutter/material.dart';
import 'package:quero_quero/financas/inicial/pagina_de_financas.dart';
import 'package:quero_quero/financas/saldo_em_caixa/saldo_em_caixa_factory.dart';

import '../extrato/extrato_factory.dart';

final class PaginaDeFinancasFactory {
  Widget cria() {
    final saldo = SaldoEmCaixaFactory();
    final extrato = ExtratoFactory();
    return PaginaDeFinancas(
      saldoEmCaixa: saldo.cria(),
      extrato: extrato.cria(),
    );
  }
}
