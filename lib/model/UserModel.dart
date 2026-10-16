import 'package:flutter_web_mobile/model/MessageModel.dart';

class UserModel {
  final String id;
  String nome;
  String email;
  String senha;
  List <MessageModel> mensagens;

  UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.mensagens,
  });
}
