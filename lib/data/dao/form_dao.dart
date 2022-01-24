


import 'package:flutter_crud_localdb/data/db/db_helper.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';

class FormDao{
  final dbProvider = DataBaseProvider.dataBaseProvider;

  Future<Future<int>?> createForm(FormModel forms) async{
    final db = await dbProvider.database;
    var result = db?.insert(formTable, forms.toJson());
    return result;
  }

  Future<List<FormModel>> getForms({List<String>? columns, String? query}) async{
    final db = await dbProvider.database;
    List<Map<String, dynamic>>? result;
    if(query != null && query != ''){
      if(query.isNotEmpty) {
        result = await db?.query(formTable, columns: columns, where: 'title LIKE ?', whereArgs: ["%$query%"]);
      }
    }else{
      result = await db?.query(formTable, columns: columns, orderBy: 'id DESC');
    }
    List<FormModel> forms = result!.isNotEmpty ? result.map((item) => FormModel.fromDatabaseJson(item)).toList() : [];
    return forms;
  }

  Future<int> updateForms(FormModel forms) async{
    final db = await dbProvider.database;
    var result =  await db!.update(formTable, forms.toJson(), where: 'id = ?', whereArgs: [forms.id]);
    return result;
  }

  Future<int?> deleteForms(int id) async{
    final db = await dbProvider.database;
    var result = await db?.delete(formTable, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<List<FormModel>> getFormById({List<String>? columns, int? id}) async{
    final db = await dbProvider.database;
    var result = await db?.query(formTable, columns: columns, where: 'id = ?', whereArgs: [id]);
    List<FormModel> forms = result!.isNotEmpty ? result.map((form) => FormModel.fromDatabaseJson(form)).toList() : [];
    return forms;
  }

  Future deleteAllForms() async{
    final db = await dbProvider.database;
    var result = await db?.delete(formTable);
    return result;
  }


}