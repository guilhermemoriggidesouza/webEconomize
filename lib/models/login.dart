import 'package:webEconomize/domain/Login.dart';

class LoginModel {
  int idlogin;
  String login;
  String senha;
  String nome;

  LoginModel({
    this.idlogin,
    this.login,
    this.senha,
    this.nome
  });

  Map<String, dynamic> toMap() {
    return {
      'idlogin': idlogin,
      'senha': senha,
      'login': login,
      'nome': nome,
    };
  }

  static Login fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Login(
      idlogin: map['idlogin'],
      login: map['login'],
      senha: map['senha'],
      nome: map['nome'],
    );
  }
}