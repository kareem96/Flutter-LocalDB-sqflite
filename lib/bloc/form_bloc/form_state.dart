



import 'package:equatable/equatable.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';

abstract class FormsStates extends Equatable{
  final String? message;
  final FormModel? forms;
  const FormsStates({this.forms, this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialFormState extends FormsStates{}
class FormsLoading extends FormsStates{}
class FormsError extends FormsStates{
  final String? errorMessage;

  const FormsError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  @override
  String toString() => 'Forms No Data (message: $errorMessage)';

}

class FormHasData extends FormsStates{
  const FormHasData({required FormModel forms}) : super(forms: forms);
}

class Success extends FormsStates{
  Success({required String successMessage}): super(message: successMessage);
}