import 'extrato.dart';

abstract class ExtratoCasoDeUso {
  Future<Extrato> carregaExtrato();
}

final class ExtratoCasoDeUsoImpl implements ExtratoCasoDeUso {
  @override
  Future<Extrato> carregaExtrato() async {
    return Extrato(
      transacoes: List.generate(
        10,
        (index) => Transacao(
          valor: 400000 + (index * 10),
          tipo: index % 2 == 0 ? TransacaoTipo.entrada : TransacaoTipo.saida,
          data: DateTime.now(),
        ),
      ),
    );
  }
}
