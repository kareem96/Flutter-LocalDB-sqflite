


import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const formTable = 'form';

class DataBaseProvider {
  static final DataBaseProvider dataBaseProvider = DataBaseProvider();
  Database? _database;

  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,'dbForms.db');
    var database = await openDatabase(path, version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if(newVersion > oldVersion){}
  }

  void initDB(Database database, int version) async {
    await database.execute('CREATE TABLE $formTable ('
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "title TEXT, "
        "description TEXT "
    ')');
  }
}