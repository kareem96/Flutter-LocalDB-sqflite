



import 'package:flutter_crud_localdb/data/model/form_model.dart';
import 'package:flutter_crud_localdb/data/provider/forms_provider.dart';

class FormsRepository{
  final FormsProvider repository;
  FormsRepository(this.repository);


  getAll(){
    return repository.getAll();
  }

  save(FormsModel forms){
    return repository.save(forms);
  }

  update(FormsModel forms){
    return repository.update(forms);
  }

  delete(int id){
    return repository.delete(id);
  }
}