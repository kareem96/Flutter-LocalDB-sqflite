



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';
import 'package:flutter_crud_localdb/data/respositories/forms_repository.dart';

import 'list_event.dart';
import 'list_state.dart';

class FormListBloc extends Bloc<FormListEvent, FormListState>{
  final FormsRepository formsRepository;
  FormListBloc({required this.formsRepository}) : super(InitialFormsListState());

  Stream<FormListState> mapEventToState(FormListEvent event) async*{
  yield FormListLoading();
  if(event is GetForms){
    try{
      List<FormModel> forms = await formsRepository.getAllForms(query: event.query);
      yield FormListHasData(forms);
    }catch (e){
      yield FormListError(e.toString());
    }
  }else if(event is DeleteForms){
   try{
     await formsRepository.deleteFormById(event.forms!.id ?? 0);
     yield FormListHasData(await formsRepository.getAllForms(query: event.query));
   }catch(e){
     yield FormListError(e.toString());
   }
  }
  }
}