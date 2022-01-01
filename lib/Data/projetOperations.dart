// ignore_for_file: file_names, avoid_print, unnecessary_brace_in_string_interps

import 'package:flutterproject/Data/database.dart';
import 'package:flutterproject/models/Projet.dart';

class ProjetOperation {
  late ProjetOperation projetOperation;
  final dbProvider = ProjectDataBase.instance;

  createProjet(Projet projet) async {
    final db = await dbProvider.database;
    db.insert('PROJET', projet.toMap());
    print("project inserted");
    List<Map<String, dynamic>> allRows = await db.query('PROJET');
    print(allRows);
  }

  Future<List<Projet>> getAllProjets() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('PROJET');
    print(allRows);
    List<Projet> projets =
        allRows.map((projet) => Projet.fromMap(projet)).toList();
    return projets;
  }

  deleteProjectById(int id) async {
    final db = await dbProvider.database;
    await db.execute('''
    delete from PROJET WHERE id = ${id} ''');
    print("done");
  }

  updateProjetById(int id, String name, String type, String description) async {
    final db = await dbProvider.database;
    db.execute('''
    update PROJET
    set name = "${name}" 
    where id = ${id}
    ''');
    db.execute('''
    update PROJET
    set type = "${type}" 
    where id = ${id}
    ''');
    db.execute('''
    update PROJET
    set description = "${description}" 
    where id = ${id}
    ''');
    print("done");
  }
}
