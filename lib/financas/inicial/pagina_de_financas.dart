import 'package:flutter/material.dart';

class PaginaDeFinancas extends StatelessWidget {
  const PaginaDeFinancas({
    super.key,
    required this.saldoEmCaixa,
  });
  final Widget saldoEmCaixa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [saldoEmCaixa],
      ),
    );
  }
}
