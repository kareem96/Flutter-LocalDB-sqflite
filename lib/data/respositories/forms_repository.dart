


import 'package:flutter_crud_localdb/data/dao/form_dao.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';

class FormsRepository{
  final formsDao = FormDao();

  Future getAllForms({String? query}) => formsDao.getForms(query: query);

  Future deleteFormById(int id) => formsDao.deleteForms(id);

  Future getFormsById({required int id}) => formsDao.getFormById(id: id);

  Future insertForms(FormModel forms) => formsDao.createForm(forms);

  Future updateForms(FormModel forms) => formsDao.updateForms(forms);

}