import 'dart:io';
import 'package:path/path.dart';
import 'package:persona/src/models/persona_model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
export 'package:persona/src/models/persona_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._(); //Instacia de la Clase

  DBProvider._(); //Constructor

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    //Direccion de la Base de Datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'PersonaDB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Personas('
          ' id INTEGER PRIMARY KEY,'
          ' nombre TEXT,'
          ' direccion TEXT,'
          ' telefono INTEGER'
          ')');
    });
  }

  //Crear Registros
  nuevaPersona(PersonaModel nuevaPersona) async {
    final db = await database;
    final res = await db.insert('Personas', nuevaPersona.toJson());
    return res;
  }

  //Select - Obtener registro por id
  Future<PersonaModel> getPersonaId(int id) async {
    final db = await database;
    final res = await db.query('Personas', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? PersonaModel.fromJson(res.first) : null;
  }

  //Select - Obtener todos los registros
  Future<List<PersonaModel>> getTodasPersonas() async {
    final db = await database;
    final res = await db.query('Personas');

    List<PersonaModel> list =
        res.isNotEmpty ? res.map((c) => PersonaModel.fromJson(c)).toList() : [];
    return list;
  }

  //Actualizar registro
  Future<int> updatePersona(PersonaModel nuevaPersona) async {
    final db = await database;
    final res = await db.update('Personas', nuevaPersona.toJson(),
        where: 'id = ?', whereArgs: [nuevaPersona.id]);
    return res;
  }

  //Eliminar registro
  Future<int> deletePersona(int id) async {
    final db = await database;
    final res = await db.delete('Personas', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  //Eliminar todos los registros
  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Personas');
    return res;
  }
}
