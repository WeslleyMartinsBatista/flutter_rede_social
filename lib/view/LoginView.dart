import 'package:flutter/material.dart';

class loginView extends StatelessWidget {
  const loginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF071835),
              Color(0xFF0A2A55),
            ],
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bem-vindo!',
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              // --- Email ---
              TextField(
                keyboardType: TextInputType.emailAddress, // permite '@'
                style: const TextStyle(color: Colors.white), // cor do texto
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(color: Colors.white70), // tamanho do texto
                  prefixIcon: const Icon(Icons.email, color: Colors.white70), // ícone de carta no inicio
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // borda arrendondada
                    borderSide: const BorderSide(color: Colors.white30), // borda quando desativado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // borda arrendondada
                    borderSide: const BorderSide(color: Colors.blue), // borda quando ativado
                  ),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.01), // fundo quase transparente
                ),
              ),

              const SizedBox(height: 20), // gap vertical entre os textfield

              // --- Senha ---
              TextField(
                obscureText: true, // Oculta o texto digitado (mostra bolinhas)
                style: const TextStyle(color: Colors.white), 
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: const TextStyle(color: Colors.white70),// tamanho do texto
                  prefixIcon: const Icon(Icons.lock, color: Colors.white70), // ícone de cadeado no inicio
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.01),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
