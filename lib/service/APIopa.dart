import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:webEconomize/models/login.dart';
import 'package:webEconomize/models/salario.dart';

class ApiOpa {
  static criarSessionLogin(String email, String senha) async {
    try {
      var urllogin = 'https://opaapi.herokuapp.com/login?email=$email&senha=$senha';
      var response = await get(urllogin, headers: {"Content-Type": "application/json"});

      return json.decode(response.body);
      
    } catch (error) {
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static cadastrarLogin(LoginModel login) async{
    try{
      var urllogin = 'https://opaapi.herokuapp.com/login';
      var body = json.encode(login.toMap());
      var response = await http.post(urllogin, headers: {"Content-Type": "application/json"}, body: body);
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static cadastrarSalario(SalarioModel salario) async{
    try{
      var urlSalario = 'https://opaapi.herokuapp.com/salario';
      var body = json.encode(salario.toMap());
      var response = await http.post(urlSalario, headers: {"Content-Type": "application/json"}, body: body);
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static recuperarSalarioUsuario(int idlogin) async{
     try{
      var urlSalario = 'https://opaapi.herokuapp.com/salario/$idlogin';
      var response = await http.get(urlSalario, headers: {"Content-Type": "application/json"});
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

}
