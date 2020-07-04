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
      'email': login,
      'senha': senha,
      'nome': nome,
    };
  }

  toModel(Login login){
    this.idlogin = login.idlogin;
    this.login = login.login;
    this.senha = login.senha;
    this.nome = login.nome;
  }

  static Login fromMaptoDomain(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Login(
      idlogin: map['idlogin'],
      login: map['login'],
      senha: map['senha'],
      nome: map['nome'],
    );
  }
}