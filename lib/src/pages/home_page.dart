import 'package:flutter/material.dart';
import 'package:persona/src/bloc/personas_bloc.dart';
import 'package:persona/src/models/persona_model.dart';
import 'package:persona/src/pages/persona_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final personasBloc = new PersonasBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personas'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: personasBloc.borrarPersonaTodos)
        ],
      ),
      body: PersonaPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _agregarPersona(),
        child: Icon(Icons.add),
      ),
    );
  }

  void _agregarPersona() async {
    String futureNombre = 'Alex Paco';
    String futureDireccion = 'Barrio Telchi';
    int futureTelefono = 75664056;

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
