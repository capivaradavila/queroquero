import 'saldo_em_caixa_modelo.dart';

abstract class SaldoEmCaixaCasoDeUso {
  Future<SaldoEmCaixaModelo> carregaSaldo();
}

final class SaldoEmCaixaCasoDeUsoImpl implements SaldoEmCaixaCasoDeUso {
  @override
  Future<SaldoEmCaixaModelo> carregaSaldo() async {
    return const SaldoEmCaixaModelo(400000, SaldoEmCaixaStatus.bom);
  }
}
