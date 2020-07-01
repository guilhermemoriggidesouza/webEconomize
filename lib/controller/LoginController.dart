
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class LoginController with ChangeNotifier{
  int idLogin = null;
  String email = "";
  String senha = "";
  String nome = "";

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

  bool validarLogin(context){
    print(email);
    print(senha);

    gerarSessionLogin(1, "Guilherme");
    return true;
  }
}