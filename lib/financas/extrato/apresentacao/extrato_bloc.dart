import 'package:flutter_bloc/flutter_bloc.dart';

import '../dominio/extrato_caso_de_uso.dart';
import 'extrato_estados.dart';
import 'extrato_eventos.dart';

final class ExtratoBloc extends Bloc<ExtratoEvento, ExtratoParaVisualizacao> {
  ExtratoBloc({
    required ExtratoCasoDeUso casoDeUso,
  })  : _casoDeUso = casoDeUso,
        super(ExtratoNaoCarregadoParaVisualizacao()) {
    on<CarregaExtrato>(_onCarregaSaldo);
  }

  final ExtratoCasoDeUso _casoDeUso;

  void _onCarregaSaldo(
    ExtratoEvento event,
    Emitter<ExtratoParaVisualizacao> emit,
  ) {
    _casoDeUso.carregaExtrato().then((extrato) {
      emit(
        ExtratoCarregadoParaVisualizacao(
          transacoes: const [],
        ),
      );
    }).catchError((error) {
      emit(ExtratoComErroParaVisualizacao());
    });
  }
}
