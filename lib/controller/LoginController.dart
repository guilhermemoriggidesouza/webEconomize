
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'sessions/SessionLogin.dart';

class LoginController with ChangeNotifier{

  mudarNomeSessaoLogin(context){
    Provider.of<SessionLogin>(context).changeNome('Richard pionto');
  }

}