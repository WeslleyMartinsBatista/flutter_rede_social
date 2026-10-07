import 'package:flutter/material.dart';

class AccountRecoveryView extends StatelessWidget {
  const AccountRecoveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperação de senha')),
      body: const Center(child: Text('Tela de Recuperação')),
    );
  }
}
