



import 'package:equatable/equatable.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';

abstract class FormListEvent extends Equatable{
  final FormModel? forms;
  final String? query;

  FormListEvent({this.forms, this.query});

  @override
  List<Object?> get props => [forms, query];
}

class GetForms extends FormListEvent{
  GetForms({String? query}): super(query: query);
}

class DeleteForms extends FormListEvent{
  DeleteForms({FormModel? forms}): super(forms: forms);
}