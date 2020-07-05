import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:webEconomize/domain/Login.dart';
import 'package:webEconomize/models/login.dart';

class ApiOpa {
  static criarSessionLogin(String email, String senha) async {
    try {
      var urllogin = 'https://opaapi.herokuapp.com/login?email=$email&senha=$senha';
      var response = await get(urllogin, headers: {"Content-Type": "application/json"});

      return json.decode(response.body);
      
    } catch (error) {
      return {"msg": "Error, tente novamento mais tarde", "resp": error};
    }
  }

  static cadastrarLogin(LoginModel login) async{
    try{
      var urllogin = 'https://opaapi.herokuapp.com/login';
      var body = json.encode(login.toMap());
      var response = await http.post(urllogin, headers: {"Content-Type": "application/json"}, body: body);
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": error};
    }
  }

}
