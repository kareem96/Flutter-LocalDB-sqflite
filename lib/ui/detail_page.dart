




import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_crud_localdb/controller/forms_controller.dart';
import 'package:get/get.dart';

class DetailFormPage extends GetView<FormsController>{
  @override
  final controller = Get.find<FormsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail'),),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    enableInteractiveSelection: false,
                    onTap: () { FocusScope.of(context).requestFocus(FocusNode()); },
                    controller: controller.fullNameController,
                    focusNode: controller.fullNameFocusNode,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Nick Name',
                    ),
                    enableInteractiveSelection: false,
                    onTap: () { FocusScope.of(context).requestFocus(FocusNode()); },
                    controller: controller.nickNameController,
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
                    enableInteractiveSelection: false,
                    onTap: () { FocusScope.of(context).requestFocus(FocusNode()); },
                    controller: controller.genderController,
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
                    enableInteractiveSelection: false,
                    onTap: () { FocusScope.of(context).requestFocus(FocusNode()); },
                    controller: controller.telpController,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: controller.telpFocusNode.requestFocus,
                    onFieldSubmitted: (String value){
                      controller.telpFocusNode.requestFocus();
                    },
                    validator: (value){

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
                    enableInteractiveSelection: false,
                    onTap: () { FocusScope.of(context).requestFocus(FocusNode()); },
                    controller: controller.emailController,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: controller.emailFocusNode.requestFocus,
                    onFieldSubmitted: (String value){
                      controller.emailFocusNode.requestFocus();
                    },
                    validator: (value){

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
                    enableInteractiveSelection: false,
                    onTap: () { FocusScope.of(context).requestFocus(FocusNode()); },
                    controller: controller.addressController,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: controller.addressFocusNode.requestFocus,
                    onFieldSubmitted: (String value){
                      controller.addressFocusNode.requestFocus();
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
                      labelText: 'Job',
                    ),
                    enableInteractiveSelection: false,
                    onTap: () { FocusScope.of(context).requestFocus(FocusNode()); },
                    controller: controller.jobController,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: controller.jobFocusNode.requestFocus,
                    onFieldSubmitted: (String value){
                      controller.jobFocusNode.requestFocus();
                    },
                    validator: (value){

                    },
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        )
    );
  }

}