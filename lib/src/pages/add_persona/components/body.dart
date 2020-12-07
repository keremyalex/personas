import 'package:flutter/material.dart';
import 'package:persona/src/bloc/personas_bloc.dart';
import 'package:persona/src/models/persona_model.dart';
import 'package:persona/src/pages/add_persona/components/text_form_field_persona.dart';
import 'package:persona/src/pages/add_persona/components/text_form_field_telefono.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final personasBloc = new PersonasBloc();
  final nombreIngresado = new TextEditingController();
  final direccionIngresado = new TextEditingController();
  final telefonoIngresado = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
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
          TextFormFieldPersona(
            controller: nombreIngresado,
            titulo: 'Nombre:',
            hintText: 'Ingrese su nombre',
            icono: Icon(Icons.account_circle),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormFieldPersona(
            controller: direccionIngresado,
            titulo: 'Dirección:',
            hintText: 'Ingrese su dirección',
            icono: Icon(Icons.account_balance),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormFieldTelefono(
            controller: telefonoIngresado,
            titulo: 'Teléfono:',
            hintText: 'Ingrese su teléfono',
            icono: Icon(Icons.call),
          ),
          SizedBox(
            height: 50,
          ),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            onPressed: () => {
              _agregarPersona(nombreIngresado.text, direccionIngresado.text,
                  int.parse(telefonoIngresado.text)),
              Navigator.pop(context)
            },
            child: Text('Insertar',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    ));
  }

  void _agregarPersona(
      String futureNombre, String futureDireccion, int futureTelefono) async {
    if (futureNombre != null &&
        futureDireccion != null &&
        futureTelefono != null) {
      final persona = PersonaModel(
          nombre: futureNombre,
          direccion: futureDireccion,
          telefono: futureTelefono);
      personasBloc.agregarPersona(persona);
    }
  }
}
