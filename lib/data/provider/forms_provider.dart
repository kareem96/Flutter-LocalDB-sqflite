


import 'package:flutter_crud_localdb/data/db/forms_service.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';
import 'package:get/get.dart';

class FormsProvider{
  final formsService = Get.find<FormsService>();


  Future<List<FormsModel>?> getAll() async{
    return await formsService.getAll();
  }

  Future<FormsModel> save(FormsModel forms) async{
    await Future.delayed(const Duration(seconds: 2));
    return await formsService.save(forms);
  }

  Future<FormsModel> update(FormsModel forms) async{
    await Future.delayed(const Duration(seconds: 2));
    return await formsService.update(forms);
  }

  Future<int?> delete (int formsId) async{
    await Future.delayed(const Duration(seconds: 2));
    return await formsService.delete(formsId);
  }
}