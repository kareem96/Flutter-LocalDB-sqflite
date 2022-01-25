import 'package:flutter/material.dart';
import 'package:flutter_crud_localdb/data/db/forms_service.dart';
import 'package:flutter_crud_localdb/ui/page_list.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => FormsService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title:  '',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: HomePageList(),
    );
  }
}

