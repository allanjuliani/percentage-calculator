import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'calc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      //title: 'Flutter Demo',
      theme: ThemeData(
        //backgroundColor: Colors.red,
        primaryColor: Colors.lightBlue,
        //primaryColor: Colors.teal[300],
        //brightness: Brightness.light,
        //accentColor: Colors.green,
        //textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.blueAccent[200],
      ),
      home: CalcPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
