
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

  limparLogin(){
    loginUsuario = null;
    notifyListeners();
  }

  Future<Map<String, dynamic>> validarLogin(context) async{
    try{
      if(email == "" || senha == "") return {"msg":"informe todos os valores", "status": false};
      dynamic response = await ApiOpa.criarSessionLogin(email, senha);
      dynamic loginMap = response["resp"];
      bool status = false;
      try{
        if(loginMap != null){
          loginUsuario = LoginModel.fromMaptoDomain(loginMap);
          status = true;
        }
      }catch(error){
        print(error);
      }
      notifyListeners();
      return {"msg" : response["msg"], "status": status};
    }catch(error){
      return {"msg" : error.toString(), "status": false};
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