


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crud_localdb/bloc/form_bloc/form_event.dart';
import 'package:flutter_crud_localdb/bloc/form_bloc/form_state.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';
import 'package:flutter_crud_localdb/data/respositories/forms_repository.dart';

class FormsBloc extends Bloc<FormsEvent, FormsStates>{
  final FormsRepository formsRepository;
  FormsBloc({required this.formsRepository}) : super(InitialFormState());
  @override
  Stream<FormsStates> mapEventToState(FormsEvent event) async*{
    yield FormsLoading();
    if(event is GetFormItem){
      try{
      yield FormHasData(forms: event.forms?.id == null ? FormModel() : await formsRepository.getFormsById(id: event.forms?.id ?? 0));
      }catch(e){
        yield FormsError(e.toString());
      }
    }else if(event is BackEvent){
      yield InitialFormState();
    }else if(event is CreatesForms){
      try{
        await formsRepository.insertForms(event.forms!);
        yield Success(successMessage: event.forms?.fullName ?? '' + ' created');
      }catch (e){
        yield FormsError(e.toString());
      }
    }else if(event is UpdateForms){
      try{
        await formsRepository.updateForms(event.forms!);
        yield Success(successMessage: event.forms?.fullName ?? '' + ' updated');
      }catch(e){
        yield FormsError(e.toString());
      }
    }
  }

}