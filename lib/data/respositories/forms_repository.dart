


import 'package:flutter_crud_localdb/data/dao/form_dao.dart';

class FormsRepository{
  final formsDao = FormDao();

  Future getAllForms({String? query}) => formsDao.getForms(query: query);

  Future deleteFormById(int id) => formsDao.deleteForms(id);

}