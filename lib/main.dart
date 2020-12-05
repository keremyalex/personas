import 'package:flutter/material.dart';
import 'package:persona/src/pages/add_persona/add_persona_page.dart';
import 'package:persona/src/pages/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //theme: ThemeData(brightness: Brightness.light),
      initialRoute: 'HomePage',
      routes: {
        'HomePage': (context) => HomePage(),
        'AddPersonaPage': (context) => AddPersonaPage()
      },
    );
  }
}
