import 'package:flutter_qr_maps/models/models.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static Database? _database;
  static const tableScansName = 'Scans';

  static final DbProvider db = DbProvider._();

  DbProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDb();

    return _database!;
  }

  Future<Database> initDb() async {
    //Path de donde almacenamos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = p.join(documentsDirectory.path, 'ScansDb.db');
    print(path);

    //Crear Base de Datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE $tableScansName(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
          )
      ''');
    });
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    //Verificar Base de Datos
    final db = await database;

    final res = await db.rawInsert('''
        INSERT INTO Scans(id, tipo, valor)
          VALUES($id, '$tipo', '$valor)
      ''');
    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    //Verificar Base de Datos
    final db = await database;

    final res = await db.insert(tableScansName, nuevoScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanByid(int id) async {
    final db = await database;
    final res =
        await db.query(tableScansName, where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getScansPorTipo(String tipo) async {
    final db = await database;
    final res = await db
        .rawQuery('''SELECT * FROM $tableScansName WHERE tipo = '$tipo' ''');

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<List<ScanModel>> getTodosLosScans() async {
    final db = await database;
    final res = await db.query(tableScansName);

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update(tableScansName, nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res =
        await db.delete(tableScansName, where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.delete(tableScansName);
    return res;
  }
}
