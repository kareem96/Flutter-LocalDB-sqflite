



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crud_localdb/bloc/list_bloc/list_bloc.dart';
import 'package:flutter_crud_localdb/bloc/list_bloc/list_event.dart';

class PageList extends StatefulWidget {
  static const  route = '/page_list';
  const PageList({Key? key}) : super(key: key);

  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final TextEditingController _searchController = TextEditingController();

  FormListBloc? formListBloc;

  @override
  void initState() {
    formListBloc = BlocProvider.of<FormListBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 1 /8,
              padding: EdgeInsets.all(10.0),
              child: TextFormField(),
            ),
            Container(
              height: size.height * 6 / 8,
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () async{
                  formListBloc!.add(GetForms());
                },
                child: BlocListener<FormL,
              ),
            )
          ],
        ),
      ),
    );
  }
}
