


import 'package:equatable/equatable.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';

abstract class FormListState extends Equatable{
  const FormListState();

  @override
  List<Object?> get props => [];
}

class InitialFormsListState extends FormListState{}
class FormListLoading extends FormListState{}
class FormListError extends FormListState{
  final String errorMessage;
  const FormListError(this.errorMessage);

  @override

  List<Object?> get props => [errorMessage];
  @override
  String toString() => 'Notes List Failure --> message: $errorMessage';
}

class FormListHasData extends FormListState{
  final List<FormModel>? forms;

  const FormListHasData([this.forms]);
  @override
  // TODO: implement props
  List<Object?> get props => [forms];
}