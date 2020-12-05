import 'package:flutter/material.dart';
import 'package:persona/src/pages/add_persona/components/body.dart';

class AddPersonaPage extends StatefulWidget {
  AddPersonaPage({Key key}) : super(key: key);

  @override
  _AddPersonaPageState createState() => _AddPersonaPageState();
}

class _AddPersonaPageState extends State<AddPersonaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Agregar Persona',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Body(),
    ));
  }
}
