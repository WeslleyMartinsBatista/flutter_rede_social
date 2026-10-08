import 'package:flutter/material.dart';

import '../controller/LoginController.dart'; // Ajuste o caminho se necessário
import 'RegisterView.dart';
import 'AccountRecoveryView.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _controller = LoginController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _executarLogin() async {
    FocusScope.of(context).unfocus(); // Fecha o teclado

    final sucesso = await _controller.fazerLogin(
      _emailController.text,
      _senhaController.text,
    );

    if (sucesso && mounted) {
      final usuario = _controller.currentUser.value;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bem-vindo(a), ${usuario?.nome}!'),
          backgroundColor: Colors.green,
        ),
      );

      // TODO: Redirecionar para a tela inicial / HomeView
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeView()));
    }
  }

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
            colors: [Color(0xFF071835), Color(0xFF0A2A55)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- Título Login ---
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),

                // --- Mensagem de Erro ---
                ValueListenableBuilder<String?>(
                  valueListenable: _controller.errorMessage,
                  builder: (context, erro, child) {
                    if (erro == null) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.redAccent),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.redAccent,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                erro,
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // --- Email ---
                TextField(
                  controller: _emailController,
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
                  controller: _senhaController,
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

                const SizedBox(height: 30),

                // --- Botão Entrar com Loading ---
                ValueListenableBuilder<bool>(
                  valueListenable: _controller.isLoading,
                  builder: (context, isLoading, child) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          elevation: 5,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: isLoading ? null : _executarLogin,
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),

                // --- Esqueceu Senha ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Esqueceu a senha? ',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountRecoveryView(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Recuperar',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // --- Cadastro ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não tem uma conta? ',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Cadastrar-se',
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
      ),
    );
  }
}
