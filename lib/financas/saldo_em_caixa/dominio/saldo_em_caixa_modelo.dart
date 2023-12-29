class SaldoEmCaixaModelo {
  const SaldoEmCaixaModelo(this.valor, this.status);

  final int valor;
  final SaldoEmCaixaStatus status;
}

enum SaldoEmCaixaStatus { ruim, razoavel, bom, muitoBom }
