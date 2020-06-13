import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/sessions/SessionLogin.dart';
import 'package:webEconomize/controller/sessions/SessionSalario.dart';
import 'package:webEconomize/view/main_page.dart';

void main() => runApp(
  MultiProvider(  
    providers: [
      ChangeNotifierProvider<SessionLogin>(create: (_) => SessionLogin()),
      ChangeNotifierProvider<SessionSalario>(create: (_) => SessionSalario()),
    ],
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Economize',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      localizationsDelegates: [GlobalMaterialLocalizations.delegate, 
        GlobalWidgetsLocalizations.delegate, 
        GlobalCupertinoLocalizations.delegate],
      supportedLocales: [const Locale('pt', 'BR'), const Locale('en', 'US')],
    );
  }
}


