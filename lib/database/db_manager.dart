import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:search_app/models/persona.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbManager {
  Database _database;

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

    final path = join(documentsDirectory.path, 'trabajador.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE persona('
          ' id INTEGER PRIMARY KEY,'
          ' nombre TEXT,'
          ' direccion TEXT,'
          ' telefono INTEGER,'
          ' profesion TEXT,'
          ' turno TEXT,'
          ' calificacion INTEGER'
          ')');
    });
  }

  //agregar persona
  Future<int> insertPersona(Persona persona) async {
    final db = await database;
    return await db.insert('persona', persona.toJson());
  }

  //Obtener Lista de Personas
  Future<List<Persona>> getTodasPersonas() async {
    final db = await database;
    final res = await db.query('persona');
    List<Persona> list =
        res.isNotEmpty ? res.map((c) => Persona.fromJson(c)).toList() : [];
    return list;
  }

  // Future<List<Persona>> getFiltro() async {
  //   final db = await database;
  //   final consulta = 'SELECT * FROM persona WHERE turno =?';
  //   final res = await db.rawQuery(consulta, ['tarde']);
  //   List<Persona> list =
  //       res.isNotEmpty ? res.map((c) => Persona.fromJson(c)).toList() : [];
  //   return list;
  // }
  Future<List<Persona>> getFiltroProfesion(String prof) async {
    final db = await database;
    final consulta = 'SELECT * FROM persona WHERE profesion =?';
    final res = await db.rawQuery(consulta, [prof]);
    List<Persona> list =
        res.isNotEmpty ? res.map((c) => Persona.fromJson(c)).toList() : [];
    return list;
  }

  Future<List<Persona>> getFiltro(String prof, int calif, String turn) async {
    final db = await database;
    final consulta = 'SELECT * FROM persona WHERE profesion =? and calificacion =? and turno =?';
    final res = await db.rawQuery(consulta, [prof, calif, turn]);
    List<Persona> list =
        res.isNotEmpty ? res.map((c) => Persona.fromJson(c)).toList() : [];
    return list;
  }
}
