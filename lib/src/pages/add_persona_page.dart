import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white,
        title: Text(
          'Agregar Persona',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingrese sus datos personales:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            TextFomFieldPersona(
              titulo: 'Nombre:',
              hintText: 'Ingrese su nombre',
              icono: Icon(Icons.account_circle),
            ),
            SizedBox(
              height: 20,
            ),
            TextFomFieldPersona(
              titulo: 'Dirección:',
              hintText: 'Ingrese su dirección',
              icono: Icon(Icons.account_balance),
            ),
            SizedBox(
              height: 20,
            ),
            TextFomFieldPersona(
              titulo: 'Teléfono:',
              hintText: 'Ingrese su teléfono',
              icono: Icon(Icons.call),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              onPressed: () => {},
              child: Text('Insertar',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      )),
    ));
  }
}

class TextFomFieldPersona extends StatelessWidget {
  final String titulo, hintText;
  final Icon icono;

  const TextFomFieldPersona({
    Key key,
    this.titulo,
    this.hintText,
    this.icono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        //controller: _aController,
        //keyboardType: TextInputType.number,
        //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: titulo,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            //con: Icon(Icons.access_alarm),
            suffixIcon: icono,
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
