import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:aperkuadrat_rev/models/catatan.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'catatan.db';
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE catatan (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        persamaan TEXT,
        akar1 TEXT,
        akar2 TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('catatan', orderBy: 'persamaan');
    return mapList;
  }

  Future<int> insert(Catatan object) async {
    Database db = await this.database;
    int count = await db.insert('catatan', object.toMap());
    return count;
  }

  Future<int> update(Catatan object) async {
    Database db = await this.database;
    int count = await db.update('catatan', object.toMap(),
        where: 'id=?',
        whereArgs: [object.id]);
    return count;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('catatan',
        where: 'id=?',
        whereArgs: [id]);
    return count;
  }

  Future<List<Catatan>> getCatatanList() async {
    var catatanMapList = await select();
    int count = catatanMapList.length;
    List<Catatan> catatanList = List<Catatan>();
    for (int i=0; i<count; i++) {
      catatanList.add(Catatan.fromMap(catatanMapList[i]));
    }
    return catatanList;
  }
}