import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:webEconomize/domain/Login.dart';

class ApiOpa {
  static criarSessionLogin(String email, String senha) async {
    try {
      var urllogin = 'https://opaapi.herokuapp.com/login?email=$email&senha=$senha';
      var response = await get(urllogin, headers: {"Content-Type": "application/json"});
      print("teste");
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(response.body);
      } else{
        print(response.statusCode);
      }

    } catch (error) {
      print(error);
    }
  }

  static cadastrarLogin(Login login) async{
    try{
      var urllogin = 'https://opaapi.herokuapp.com/login';
      var body = json.encode({"email": "${login.login}","nome":"${login.nome}","senha": "${login.senha}" });
      var response = await http.post(urllogin, headers: {"Content-Type": "application/json"}, body: body);
      var data = json.decode(response.body);
      return data;

    }catch(error){
      return error;
    }
  }
}
