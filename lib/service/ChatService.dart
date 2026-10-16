import 'package:flutter_web_mobile/model/UserModel.dart';
import 'package:flutter_web_mobile/database/MockDatabase.dart';

class ChatService {
  // Transforma a função num método estático ou de instância do serviço
  List<UserModel> obterConversasOrdenadas(String idUsuarioLogado) {
    final usuarioLogado = MockDatabase.usuarios.firstWhere((u) => u.id == idUsuarioLogado);
    final Map<String, DateTime> ultimaMensagemPorContacto = {};

    for (var msg in usuarioLogado.mensagens) {
      final contactoId = msg.idDestinatario;
      if (!ultimaMensagemPorContacto.containsKey(contactoId) || msg.hora.isAfter(ultimaMensagemPorContacto[contactoId]!)) {
        ultimaMensagemPorContacto[contactoId] = msg.hora;
      }
    }

    for (var outroUsuario in MockDatabase.usuarios) {
      if (outroUsuario.id == idUsuarioLogado) continue;
      for (var msg in outroUsuario.mensagens) {
        if (msg.idDestinatario == idUsuarioLogado) {
          final contactoId = outroUsuario.id;
          if (!ultimaMensagemPorContacto.containsKey(contactoId) || msg.hora.isAfter(ultimaMensagemPorContacto[contactoId]!)) {
            ultimaMensagemPorContacto[contactoId] = msg.hora;
          }
        }
      }
    }

    List<UserModel> contactosComConversa = MockDatabase.usuarios
        .where((u) => ultimaMensagemPorContacto.containsKey(u.id))
        .toList();

    contactosComConversa.sort((a, b) {
      return ultimaMensagemPorContacto[b.id]!.compareTo(ultimaMensagemPorContacto[a.id]!);
    });

    return contactosComConversa;
  }
}
