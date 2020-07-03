import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/PoupancaController.dart';
import 'package:webEconomize/controller/SalarioController.dart';
import 'package:webEconomize/view/main_page.dart';

void main() => runApp(
  MultiProvider(  
    providers: [
      ChangeNotifierProvider<SalarioController>(create: (_) => SalarioController()),
      ChangeNotifierProvider<LoginController>(create: (_) => LoginController()),
      ChangeNotifierProvider<PoupancaController>(create: (_) => PoupancaController()),
    ],
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp(
      title: 'Economize',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      localizationsDelegates: [GlobalMaterialLocalizations.delegate, 
        GlobalWidgetsLocalizations.delegate, 
        GlobalCupertinoLocalizations.delegate],
      supportedLocales: [
        const Locale('pt', 'BR'), 
        const Locale('en', 'US')
      ],
    );
  }
}


