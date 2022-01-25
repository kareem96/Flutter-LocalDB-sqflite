


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_crud_localdb/controller/forms_controller.dart';
import 'package:get/get.dart';

class FormsEditPage extends GetView<FormsController>{
  @override
  final controller = Get.find<FormsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${controller.title}'),),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  controller: controller.fullNameController,
                  focusNode: controller.fullNameFocusNode,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: controller.fullNameFocusNode.requestFocus,
                  onFieldSubmitted: (String value){
                    controller.fullNameFocusNode.requestFocus();
                  },
                  validator: (value){
                    return controller.validateFullName(value);
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Nick Name',
                  ),
                  controller: controller.nickNameController,
                  focusNode: controller.nickNameFocusNode,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: controller.nickNameFocusNode.requestFocus,
                  onFieldSubmitted: (String value){
                    controller.nickNameFocusNode.requestFocus();
                  },
                  validator: (value){

                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Gender',
                  ),
                  controller: controller.genderController,
                  focusNode: controller.genderFocusNode,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: controller.genderFocusNode.requestFocus,
                  onFieldSubmitted: (String value){
                    controller.genderFocusNode.requestFocus();
                  },
                  validator: (value){

                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Telp',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  controller: controller.telpController,
                  focusNode: controller.telpFocusNode,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: controller.telpFocusNode.requestFocus,
                  onFieldSubmitted: (String value){
                    controller.telpFocusNode.requestFocus();
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  controller: controller.emailController,
                  focusNode: controller.emailFocusNode,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: controller.emailFocusNode.requestFocus,
                  onFieldSubmitted: (String value){
                    controller.emailFocusNode.requestFocus();
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  controller: controller.addressController,
                  focusNode: controller.addressFocusNode,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: controller.addressFocusNode.requestFocus,
                  onFieldSubmitted: (String value){
                    controller.addressFocusNode.requestFocus();
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Job',
                  ),
                  controller: controller.jobController,
                  focusNode: controller.jobFocusNode,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: controller.jobFocusNode.requestFocus,
                  onFieldSubmitted: (String value){
                    controller.jobFocusNode.requestFocus();
                  },
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        controller.editMode();
                        if(controller.loading.value == true){
                          Get.dialog(const Center(child: CircularProgressIndicator(),));
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }


}