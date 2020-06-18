
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'sessions/SessionLogin.dart';

class LoginController with ChangeNotifier{
  String email = "";
  String senha = "";

  bool validarLogin(context){
    print(email);
    print(senha);

    Provider.of<SessionLogin>(context, listen: false).gerarSessionLogin(1, "Guilherme");
    return true;
  }
}