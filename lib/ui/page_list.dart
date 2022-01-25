



import 'package:flutter/material.dart';
import 'package:flutter_crud_localdb/controller/forms_controller.dart';
import 'package:flutter_crud_localdb/data/provider/forms_provider.dart';
import 'package:flutter_crud_localdb/data/respositories/forms_repository.dart';
import 'package:get/get.dart';

class HomePageList extends GetView<FormsController> {

  @override
  final controller = Get.put(FormsController(FormsRepository(FormsProvider())));

  HomePageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Data User'),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          controller.addForms();
        },
      ),
      body: Obx((){
        if(controller.loading.value == true){
          return const Center(child: CircularProgressIndicator(),);
        }
        return ListView.builder(
            itemCount: controller.formList.length,
            itemBuilder: (BuildContext context, int index) => Card(
              child: ListTile(
                onTap: (){
                  controller.detailForm(controller.formList[index]);
                },
                leading: CircleAvatar(
                  child: Text(controller.formList[index].fullName![0]),
                ),
                title: Text('${controller.formList[index].fullName}'),
                subtitle: Text('${controller.formList[index].telp}'),
                trailing: Wrap(children: <Widget>[
                  IconButton(
                    color: Colors.indigo,
                    icon: const Icon(Icons.edit),
                    onPressed: (){
                      controller.editForms(controller.formList[index]);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: (){
                      Get.defaultDialog(
                        title: 'Warning!',
                        middleText: 'Do you want delete, ${controller.formList[index].fullName}?',
                        textCancel: 'No',
                        onConfirm: (){
                          controller.deleteForms(controller.formList[index].id!);
                          if(controller.loading.value == true){
                            Get.dialog(const Center(child: CircularProgressIndicator(),));
                          }
                        }
                      );
                    },
                  )
                ],),
              )
            ),
        );
      }),
    );
  }
}
