


import 'package:equatable/equatable.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';

abstract class FormsEvent extends Equatable{
  final FormModel? forms;
  const FormsEvent({this.forms});

  @override
  List<Object?> get props =>[forms];
}

class BackEvent extends FormsEvent{}

class GetFormItem extends FormsEvent{
  GetFormItem({FormModel? forms}): super(forms: forms);
}

class CreatesForms extends FormsEvent{
  CreatesForms({required FormModel forms}) : super(forms: forms);
}

class UpdateForms extends FormsEvent{
  UpdateForms({required FormModel forms}) : super(forms: forms);
}