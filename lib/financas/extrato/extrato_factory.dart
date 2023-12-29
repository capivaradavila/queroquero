import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_quero/financas/extrato/apresentacao/extrato_componente.dart';

import 'apresentacao/extrato_bloc.dart';
import 'dominio/extrato_caso_de_uso.dart';

class ExtratoFactory {
  Widget cria() {
    return BlocProvider(
      create: (context) {
        return ExtratoBloc(
          casoDeUso: ExtratoCasoDeUsoImpl(),
        );
      },
      child: const ExtratoComponente(),
    );
  }
}
