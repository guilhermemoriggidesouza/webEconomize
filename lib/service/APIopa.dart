import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:webEconomize/models/login.dart';
import 'package:webEconomize/models/metas.dart';
import 'package:webEconomize/models/movSaida.dart';
import 'package:webEconomize/models/salario.dart';

class ApiOpa {
  //cadastrar
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

  static cadastrarMetas(MetaModel meta) async{
    try{
      var urlMetas = 'https://opaapi.herokuapp.com/metas';
      var body = json.encode(meta.toMap());
      var response = await http.post(urlMetas, headers: {"Content-Type": "application/json"}, body: body);
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static cadastrarMovSaida(MovSaidaModel movSaida) async{
    try{
      var urlMovSaida = 'https://opaapi.herokuapp.com/movSaida';
      var body = json.encode(movSaida.toMap());
      var response = await http.post(urlMovSaida, headers: {"Content-Type": "application/json"}, body: body);
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }



  //recuperar
  static recuperarSalarioUsuario(int idlogin) async{
     try{
      var urlSalario = 'https://opaapi.herokuapp.com/salario/$idlogin';
      var response = await http.get(urlSalario, headers: {"Content-Type": "application/json"});
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static recuperarPoupancaByLogin(int idlogin) async{
     try{
      var urlPoupanca = 'https://opaapi.herokuapp.com/poupanca/total/$idlogin';
      var response = await http.get(urlPoupanca, headers: {"Content-Type": "application/json"});
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static recuperarPoupancaBySalario(int idSalario) async{
     try{
      var urlPoupanca = 'https://opaapi.herokuapp.com/poupanca/unico/$idSalario';
      var response = await http.get(urlPoupanca, headers: {"Content-Type": "application/json"});
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static recuperarMetasByLogin(int idlogin) async{
    try{
      var urlMetas = 'https://opaapi.herokuapp.com/metas/$idlogin';
      var response = await http.get(urlMetas, headers: {"Content-Type": "application/json"});
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static recuperarMovSaida(int idMovSaida) async{
    try{
      var urlMovSaida = 'https://opaapi.herokuapp.com/movSaida/$idMovSaida';
      var response = await http.get(urlMovSaida, headers: {"Content-Type": "application/json"});
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static recuperarSalarioDetalhe(int idsalario) async{
    try{
      var urlSalario = 'https://opaapi.herokuapp.com/salarioDescricao/$idsalario';
      var response = await http.get(urlSalario, headers: {"Content-Type": "application/json"});

      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }



  //remover
  static removerSalario(int idSalario) async{
    try{
      var urlSalario = 'https://opaapi.herokuapp.com/salario/$idSalario';
      var response = await http.delete(urlSalario, headers: {"Content-Type": "application/json"});
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static removerMeta(int idmeta) async{
    try{
      var urlSalario = 'https://opaapi.herokuapp.com/metas/$idmeta';
      var response = await http.delete(urlSalario, headers: {"Content-Type": "application/json"});
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }
  }

  static removerMovSaida(int idmovSaida) async{
  try{
    var urlSalario = 'https://opaapi.herokuapp.com/movSaida/$idmovSaida';
    var response = await http.delete(urlSalario, headers: {"Content-Type": "application/json"});
    
    return json.decode(response.body);

  }catch(error){
    return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
  }
}



  //modificar 
  static modificarSalario(double valorModificar, int idsalario) async{
    try{
      var urlSalario = 'https://opaapi.herokuapp.com/metas/$idsalario';
      var body = json.encode({"valorModificar": valorModificar});
      var response = await http.put(urlSalario, headers: {"Content-Type": "application/json"}, body: body);
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }   
  }

  static modificarPoupancaDeSalario(double valorModificar, int idsalario) async{
    try{
      var urlPoupanca = 'https://opaapi.herokuapp.com/poupanca/$idsalario';
      var body = json.encode({"valorModificar": valorModificar});
      var response = await http.put(urlPoupanca, headers: {"Content-Type": "application/json"}, body: body);
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }   
  }

  static concluirMeta(int idmeta) async{
    try{
      var urlMeta = 'https://opaapi.herokuapp.com/metas/$idmeta';
      var response = await http.put(urlMeta, headers: {"Content-Type": "application/json"});
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }   
  }

  static concluirMovSaida(int idmovSaida, double valorMovSaidaConcluir) async{
    try{
      var urlMovSaida = 'https://opaapi.herokuapp.com/movSaida/$idmovSaida';
      var body = json.encode({"valorModificar": valorMovSaidaConcluir});
      var response = await http.put(urlMovSaida, headers: {"Content-Type": "application/json"}, body:body);
      
      return json.decode(response.body);

    }catch(error){
      return {"msg": "Error, tente novamento mais tarde", "resp": [], "error":error};
    }   
  }

}
