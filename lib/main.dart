import 'package:flutter/material.dart';

import 'view/LoginView.dart';

void main() {
  runApp(const Flutter_Rede_Social());
}

class Flutter_Rede_Social extends StatelessWidget {
  const Flutter_Rede_Social({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
