


import 'dart:async';
import 'package:flutter_crud_localdb/data/model/form_model.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class FormsService extends GetxService {
  late Database? db;

  Future<FormsService> init() async{
    db = await _getDatabase();
    return this;
  }

  Future<Database> _getDatabase() async{
    var databasePath = await getDatabasesPath();
    return db = await openDatabase(
      join(databasePath, 'forms.db'),
      onCreate: (db, version){
        return db.execute(
            'CREATE TABLE forms (id INTEGER PRIMARY KEY, fullName TEXT, nickName TEXT, gender TEXT, telp TEXT, email TEXT, address TEXT, job TEXT)');
        },
      version: 1,
    );
  }


  ///get all data
  Future <List<FormsModel>?> getAll() async {
    final result = await db?.rawQuery(('SELECT * FROM forms ORDER BY id'));
    print(result);
    return result?.map((json) => FormsModel.fromJson(json)).toList();
  }


  ///save
  Future<FormsModel> save(FormsModel forms) async {
    final id = await db?.rawInsert(
      'INSERT INTO forms (fullName, nickname, gender, telp, email, address, job) VALUES (?,?,?,?,?,?,?)',
        [forms.fullName, forms.nickName, forms.gender, forms.telp, forms.email, forms.address, forms.job, ]
    );
    print(id);
    return forms.copy(id: id);
  }

  Future<FormsModel> update(FormsModel forms)async{
    final id = await db?.rawUpdate(
      'UPDATE forms SET fullName = ?, nickName = ?, gender = ?, telp = ?, email = ?, address = ?, job = ? WHERE id = ?',
      [forms.fullName, forms.nickName, forms.gender, forms.telp, forms.email, forms.address, forms.job, forms.id,]
    );
    print(id);
    return forms.copy(id: id);
  }
  Future<int?> delete(int formsId) async{
    final id = await db?.rawDelete('DELETE FROM forms WHERE id = ?', [formsId]);
    print(id);
    return id;
  }

  Future close() async{
    db?.close();
  }
}