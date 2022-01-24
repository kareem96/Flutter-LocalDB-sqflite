import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crud_localdb/bloc/forms_bloc_observer.dart';
import 'package:flutter_crud_localdb/bloc/list_bloc/list_bloc.dart';
import 'package:flutter_crud_localdb/bloc/list_bloc/list_event.dart';
import 'package:flutter_crud_localdb/data/respositories/forms_repository.dart';
import 'package:flutter_crud_localdb/ui/page_list_screen.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  },
  blocObserver: FormsBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FormListBloc>(
            create: (context){
              return FormListBloc(formsRepository: FormsRepository())..add(GetForms());
            },
          )
        ],
        child: PageList(),
      ),
    );
  }
}

