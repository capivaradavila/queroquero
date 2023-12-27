abstract class SaldoEmCaixaCasoDeUso {
  Future<SaldoEmCaixaModelo> carregaSaldo();
}

class SaldoEmCaixaModelo {
  const SaldoEmCaixaModelo(this.valor, this.status);

  final int valor;
  final SaldoEmCaixaStatus status;
}

enum SaldoEmCaixaStatus { ruim, razoavel, bom, muitoBom }

final class SaldoEmCaixaCasoDeUsoImpl implements SaldoEmCaixaCasoDeUso {
  @override
  Future<SaldoEmCaixaModelo> carregaSaldo() async {
    return const SaldoEmCaixaModelo(400000, SaldoEmCaixaStatus.bom);
  }
}
