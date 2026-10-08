import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:flutter_web_mobile/model/UserModel.dart';

import '../database/MockDatabase.dart';

class LoginController {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);
  final ValueNotifier<UserModel?> currentUser = ValueNotifier<UserModel?>(null);

  Future<bool> fazerLogin(String email, String password) async {
    errorMessage.value = null;

    final emailTrimmed = email.trim().toLowerCase();

    if (emailTrimmed.isEmpty || password.isEmpty) {
      errorMessage.value = 'E-mail e senha são obrigatórios!';
      return false;
    }

    isLoading.value = true;

    // Simulando requisição
    await Future.delayed(const Duration(milliseconds: 500));

    final usuarioEncontrado = MockDatabase.usuarios.firstWhereOrNull(
      (user) =>
          user.email.toLowerCase() == emailTrimmed && user.senha == password,
    );

    isLoading.value = false;

    if (usuarioEncontrado != null) {
      currentUser.value = usuarioEncontrado;
      return true;
    } else {
      errorMessage.value = 'E-mail ou senha incorretos!';
      return false;
    }
  }

  void dispose() {
    isLoading.dispose();
    errorMessage.dispose();
    currentUser.dispose();
  }
}
