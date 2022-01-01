// ignore_for_file: prefer_const_declarations, unused_local_variable, unnecessary_string_interpolations, avoid_print, import_of_legacy_library_into_null_safe

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProjectDataBase {
  static final ProjectDataBase instance = ProjectDataBase._init();
  static Database? _database;
  ProjectDataBase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('ProjectFlutter123.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE PROJET ( 
      id Integer primary key AUTOINCREMENT , 
      name text Not Null , 
      type text Not Null , 
      description text Not Null 
    );
   ''');

    print("done");
  }

  Future close() async {
    final db = await instance.database;
  }
}
