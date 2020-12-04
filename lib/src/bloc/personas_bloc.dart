import 'dart:async';
import 'package:persona/src/providers/db_provider.dart';

class PersonasBloc {
  static final PersonasBloc _singleton = new PersonasBloc._internal();

  //Si no existe
  factory PersonasBloc() {
    return _singleton;
  }

  PersonasBloc._internal() {
    //Obtener Personas de la base de datos
    obtenerPersonas();
  }

  final _personasController =
      new StreamController<List<PersonaModel>>.broadcast();

  Stream<List<PersonaModel>> get personasStream => _personasController.stream;

  dispose() {
    _personasController?.close();
  }

  obtenerPersonas() async {
    _personasController.sink.add(await DBProvider.db.getTodasPersonas());
  }

  agregarPersona(PersonaModel persona) async {
    await DBProvider.db.nuevaPersona(persona);
    obtenerPersonas();
  }

  borrarPersona(int id) async {
    await DBProvider.db.deletePersona(id);
    obtenerPersonas();
  }

  borrarPersonaTodos() async {
    await DBProvider.db.deleteAll();
    obtenerPersonas();
  }
}
