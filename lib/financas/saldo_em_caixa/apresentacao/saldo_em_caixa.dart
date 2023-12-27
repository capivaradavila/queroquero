import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dominio/saldo_em_caixa_caso_de_uso.dart';
import 'saldo_em_caixa_bloc.dart';
import 'saldo_em_caixa_estados.dart';
import 'saldo_em_caixa_eventos.dart';

class SaldoEmCaixa extends StatefulWidget {
  const SaldoEmCaixa({super.key});

  @override
  State<SaldoEmCaixa> createState() => _SaldoEmCaixaState();
}

class _SaldoEmCaixaState extends State<SaldoEmCaixa> {
  @override
  void initState() {
    super.initState();
    context.read<SaldoEmCaixaBloc>().add(CarregaSaldoEmCaixa());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaldoEmCaixaBloc, SaldoEmCaixaEstado>(
      builder: (context, state) {
        switch (state) {
          case SaldoEmCaixaEstadoCarregado():
            return _SaldoEmCaixaValor(state);
          case SaldoEmCaixaEstadoErro():
            return const Text('Erro');
          case SaldoEmCaixaEstadoCarregando():
            return const CircularProgressIndicator();
          case SaldoEmCaixaEstadoInicial():
            return Container();
        }
      },
    );
  }
}

class _SaldoEmCaixaValor extends StatefulWidget {
  const _SaldoEmCaixaValor(this.estado);
  final SaldoEmCaixaEstadoCarregado estado;

  @override
  State<_SaldoEmCaixaValor> createState() => _SaldoEmCaixaValorState();
}

class _SaldoEmCaixaValorState extends State<_SaldoEmCaixaValor> {
  bool _saldoVisivel = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Caixa',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Spacer(),
            ],
          ),
          Row(
            children: [
              if (_saldoVisivel)
                Text(
                  widget.estado.valor,
                  style: TextStyle(
                    color: _getColor(),
                    fontSize: 34,
                  ),
                )
              else
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: 170,
                  height: 30,
                ),
              IconButton(
                iconSize: 24,
                onPressed: () {
                  setState(() {
                    _saldoVisivel = !_saldoVisivel;
                  });
                },
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getColor() {
    switch (widget.estado.status) {
      case SaldoEmCaixaStatus.ruim:
        return Colors.red;
      case SaldoEmCaixaStatus.razoavel:
        return Colors.yellow;
      case SaldoEmCaixaStatus.bom:
        return Colors.black;
      case SaldoEmCaixaStatus.muitoBom:
        return Colors.green;
    }
  }
}
