import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'extrato_bloc.dart';
import 'extrato_estados.dart';
import 'extrato_eventos.dart';

class ExtratoComponente extends StatefulWidget {
  const ExtratoComponente({super.key});

  @override
  State<ExtratoComponente> createState() => _ExtratoComponenteState();
}

class _ExtratoComponenteState extends State<ExtratoComponente> {
  @override
  void initState() {
    super.initState();
    context.read<ExtratoBloc>().add(CarregaExtrato());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('Extrato'),
          BlocBuilder<ExtratoBloc, ExtratoParaVisualizacao>(
            builder: (context, state) {
              switch (state) {
                case ExtratoCarregadoParaVisualizacao():
                  return _ExtratoValor(state);
                case ExtratoComErroParaVisualizacao():
                  return const Text('Erro');
                case ExtratoCarregandoParaVisualizacao():
                  return const CircularProgressIndicator();
                case ExtratoNaoCarregadoParaVisualizacao():
                  return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ExtratoValor extends StatefulWidget {
  const _ExtratoValor(this.extrato);
  final ExtratoCarregadoParaVisualizacao extrato;

  @override
  State<_ExtratoValor> createState() => _ExtratoValorState();
}

class _ExtratoValorState extends State<_ExtratoValor> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.extrato.transacoes.length,
      separatorBuilder: (context, index) => Container(
        height: 1,
        color: Colors.grey[200],
      ),
      itemBuilder: (_, index) {
        final item = widget.extrato.transacoes[index];
        return _TransacaoComponente(transacao: item);
      },
    );
  }
}

class _TransacaoComponente extends StatelessWidget {
  const _TransacaoComponente({required this.transacao});
  final TransacaoParaVisualizacao transacao;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
      ),
      child: Row(
        children: [
          const Icon(Icons.house),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(transacao.titulo),
              Text(transacao.descricao),
              Text(transacao.data),
            ],
          ),
          Text(transacao.valor),
        ],
      ),
    );
  }
}
