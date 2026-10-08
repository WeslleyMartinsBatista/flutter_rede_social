import 'package:flutter_web_mobile/model/UserModel.dart';

class MockDatabase {
  static List<UserModel> usuarios = [
    UserModel(
      id: "1",
      nome: "Weslley",
      email: "Weslley@gmail.com",
      senha: "123",
    ),
  ];
}
