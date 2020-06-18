import 'package:flutter/foundation.dart';

class SessionLogin with ChangeNotifier{
  int idLogin = null;
  String nome = "";

  changeNome(String nomeParam){
    //consumir a ap
    nome = nomeParam;
    notifyListeners();
  }

  gerarSessionLogin(idLoginParams, nome){
    idLogin = idLoginParams;
    nome = nome;
    notifyListeners();
  }
}