



import 'package:flutter/cupertino.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';
import 'package:flutter_crud_localdb/data/respositories/forms_repository.dart';
import 'package:flutter_crud_localdb/ui/detail_page.dart';
import 'package:flutter_crud_localdb/ui/forms_edit_page.dart';
import 'package:get/get.dart';

class FormsController extends GetxController{

  final FormsRepository repository;
  FormsController(this.repository);


  String title = '';

  RxBool loading = false.obs;
  final formList = <FormsModel>[].obs;


  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  FocusNode fullNameFocusNode =FocusNode();
  FocusNode nickNameFocusNode =FocusNode();
  FocusNode genderFocusNode =FocusNode();
  FocusNode telpFocusNode =FocusNode();
  FocusNode emailFocusNode =FocusNode();
  FocusNode addressFocusNode =FocusNode();
  FocusNode jobFocusNode =FocusNode();


  @override
  void onReady() {
    getAll();
    super.onReady();
  }

  getAll() {
    loading(true);
    repository.getAll().then((data){
      formList.value = data;
      loading(false);
    });
  }
  addForms(){
    formKey.currentState?.reset();
    fullNameController.text = '';
    nickNameController.text = '';
    genderController.text = '';
    telpController.text = '';
    emailController.text = '';
    addressController.text = '';
    jobController.text = '';
    title = 'Input Forms';
    Get.to(() => FormsEditPage());
  }
  editMode(){
    if(formKey.currentState!.validate()){
      loading(true);
      if(Get.arguments == null){
        saveForms();
      }else{
        updateForms();
      }
    }
  }
  refreshFormsList(){
    getAll();
    Get.back();
    Get.back();
  }
  saveForms() async{
    final forms = FormsModel(
      fullName: fullNameController.text.trim(),
      nickName: nickNameController.text.trim(),
      gender: genderController.text.trim(),
      telp: telpController.text.trim(),
      email: emailController.text.trim(),
      address: addressController.text.trim(),
      job: jobController.text.trim(),
    );
    repository.save(forms).then((data) {
      loading(false);
      refreshFormsList();
    });
  }
  deleteForms(int formsId) async{
    loading(true);
    repository.delete(formsId).then((data){
      loading(false);
      refreshFormsList();
    });
  }
  editForms(FormsModel forms){
    fullNameController.text = forms.fullName ?? '';
    nickNameController.text = forms.nickName ?? '';
    genderController.text = forms.gender ?? '';
    telpController.text = forms.telp ?? '';
    emailController.text = forms.email ?? '';
    addressController.text = forms.address ?? '';
    jobController.text = forms.job ?? '';
    Get.to(() => FormsEditPage(), arguments: forms.id);
  }
  detailForm(FormsModel forms){
    fullNameController.text = forms.fullName ?? '';
    nickNameController.text = forms.nickName ?? '';
    genderController.text = forms.gender ?? '';
    telpController.text = forms.telp ?? '';
    emailController.text = forms.email ?? '';
    addressController.text = forms.address ?? '';
    jobController.text = forms.job ?? '';
    Get.to(() => DetailFormPage(), arguments: forms.id);
  }
  updateForms() async{
    final forms = FormsModel(
      id: Get.arguments,
      fullName: fullNameController.text.trim(),
      nickName: nickNameController.text.trim(),
      gender: genderController.text.trim(),
      telp: telpController.text.trim(),
      email: emailController.text.trim(),
      address: addressController.text.trim(),
      job: jobController.text.trim(),
    );
    repository.update(forms).then((data) {
      loading(false);
      refreshFormsList();
    });
  }


  validateFullName(String? value){
    if(value == null || value.isEmpty){
      return 'Field not empty';
    }
    return null;
  }
}