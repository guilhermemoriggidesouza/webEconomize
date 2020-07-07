
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/domain/Login.dart';
import 'package:webEconomize/models/login.dart';
import 'package:webEconomize/service/APIopa.dart';

class LoginController with ChangeNotifier{
  String email = "";
  String senha = "";
  Login loginUsuario = null;
  LoginModel loginCadastro = LoginModel();

  setEmail(value){
    email = value;
  }

  setSenha(value){
    senha = value;
  }

  Future<String> validarLogin(context) async{
    try{
      if(email == "" || senha == "") return "informe todos os valores";
      dynamic response = await ApiOpa.criarSessionLogin(email, senha);
      dynamic loginMap = response["resp"];
      try{
        loginUsuario = LoginModel.fromMaptoDomain(loginMap);
      }catch(error){
        print(error);
      }
      notifyListeners();
      return response["msg"];
    }catch(error){
      return error.toString();
    }
  }

  Future<String> cadastrarLogin() async{
    try{
      if(loginCadastro.login == "" || loginCadastro.senha == "" || loginCadastro.nome == "") return "Preencha todos os dados";
      dynamic respostaLogin = await ApiOpa.cadastrarLogin(loginCadastro);
      return respostaLogin["msg"];
    }catch(error){
      return error.toString();
    }
  }
}