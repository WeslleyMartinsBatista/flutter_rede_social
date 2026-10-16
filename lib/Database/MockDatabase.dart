import 'package:flutter_web_mobile/model/UserModel.dart';
import 'package:flutter_web_mobile/model/MessageModel.dart';

class MockDatabase {
  static List<UserModel> usuarios = [
    UserModel(
      id: "1",
      nome: "Weslley",
      email: "weslley@gmail.com",
      senha: "123",
      mensagens: [
        // Usamos DateTime.now().subtract para simular que a mensagem foi enviada há alguns minutos
        MessageModel(
          idDestinatario: "2", 
          text: "Olá Maria!", 
          hora: DateTime.now().subtract(const Duration(minutes: 15)), // Enviada há 15 minutos
        ),
        MessageModel(
          idDestinatario: "2", 
          text: "Viste o projeto?", 
          hora: DateTime.now().subtract(const Duration(minutes: 13)), // Enviada há 13 minutos
        ),
      ],
    ),
    UserModel(
      id: "2",
      nome: "Maria",
      email: "maria@gmail.com",
      senha: "456",
      mensagens: [
        // DateTime.now() define o horário exato de agora (mais recente)
        MessageModel(
          idDestinatario: "1", 
          text: "Olá Weslley! Vi sim.", 
          hora: DateTime.now().subtract(const Duration(minutes: 10)), // Enviada há 10 minutos
        ),
      ],
    ),
  ];
}
