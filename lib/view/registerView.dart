import 'package:flutter/material.dart';
import 'LoginView.dart';

class RegisterView extends StatelessWidget {
    const RegisterView({super.key}); 

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

                            // --- Titulo Login ---
                            const Text(
                                'Cadastro',
                                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 40),

                            // --- Nome Usuario ---
                            TextField(
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                labelText: 'Nome de usuario',
                                labelStyle: const TextStyle(color: Colors.white70),
                                prefixIcon: const Icon(Icons.person, color: Colors.white70),
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

                            const SizedBox(height: 20),

                            // --- Email ---
                            TextField(
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                labelText: 'E-mail',
                                labelStyle: const TextStyle(color: Colors.white70),
                                prefixIcon: const Icon(Icons.email, color: Colors.white70),
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

                            const SizedBox(height: 20),

                            // --- Senha ---
                            TextField(
                                obscureText: true,
                                style: const TextStyle(color: Colors.white), 
                                decoration: InputDecoration(
                                labelText: 'Senha',
                                labelStyle: const TextStyle(color: Colors.white70),
                                prefixIcon: const Icon(Icons.lock, color: Colors.white70),
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
                        
                            const SizedBox(height: 20),

                            // --- Confirmar senha ---
                            TextField(
                                obscureText: true,
                                style: const TextStyle(color: Colors.white), 
                                decoration: InputDecoration(
                                labelText: 'Confirmar senha',
                                labelStyle: const TextStyle(color: Colors.white70),
                                prefixIcon: const Icon(Icons.lock, color: Colors.white70),
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

                            const SizedBox(height: 30),

                            // --- Botão Entrar ---
                            SizedBox(
                                width: double.infinity, //ocupar toda a largura disponível
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                        elevation: 5,
                                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        ),
                                    ),
                                    onPressed: () {
                                        // verificação de cadastro
                                    },
                                    child: const Text('Cadastrar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                ),
                            ),

                            const SizedBox(height: 30),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    const Text(
                                        'Já possui conta? ',
                                        style: TextStyle(color: Colors.white70, fontSize: 15),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const LoginView()), 
                                            );
                                        },
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            minimumSize: Size.zero,
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        child: const Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}