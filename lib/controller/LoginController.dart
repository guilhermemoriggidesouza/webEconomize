
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/domain/Login.dart';
import 'package:webEconomize/service/APIopa.dart';

class LoginController with ChangeNotifier{
  int idLogin = null;
  String email = "";
  String senha = "";
  String nome = "";
  Login loginCadastro = Login();

  changeNome(String nomeParam){
    //consumir a ap
    nome = nomeParam;
    notifyListeners();
  }

  setEmail(value){
    email = value;
  }

  setSenha(value){
    senha = value;
  }

  gerarSessionLogin(idLoginParams, nome){
    idLogin = idLoginParams;
    nome = nome;
    notifyListeners();
  }

  Future<bool> validarLogin(context) async{
    await ApiOpa.criarSessionLogin(email, senha);
    gerarSessionLogin(1, "Guilherme");
    return true;
  }

  Future<String> cadastrarLogin() async{
    try{
      dynamic respostaLogin = await ApiOpa.cadastrarLogin(loginCadastro);
      return respostaLogin["msg"];
    }catch(error){
      return error.toString();
    }
  }
}