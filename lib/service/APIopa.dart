import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:webEconomize/domain/Login.dart';

class ApiOpa {
  static criarSessionLogin(String email, String senha) async {
    try {
      var urllogin = 'https://opaapi.herokuapp.com/login?email=$email&senha=$senha';
      var response = await get(urllogin, headers: {"Content-Type": "application/json"});

      return validarRota(response);
      
    } catch (error) {
      return {"msg": "Error, tente novamento mais tarde", "resp": error};
    }
  }

  static cadastrarLogin(Login login) async{
    try{
      var urllogin = 'https://opaapi.herokuapp.com/login';
      var body = json.encode({"email": "${login.login}","nome":"${login.nome}","senha": "${login.senha}" });
      var response = await http.post(urllogin, headers: {"Content-Type": "application/json"}, body: body);
      
      return validarRota(response);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": error};
    }
  }

  static validarRota(response){
    if (response.statusCode == 200 || response.statusCode == 404) {
      return json.decode(response.body);
    } else {
      return {"msg": "Error, tente novamento mais tarde", "resp": response.body};
    }
  }
}
