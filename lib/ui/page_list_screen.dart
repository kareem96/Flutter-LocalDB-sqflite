



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crud_localdb/bloc/form_bloc/form_bloc.dart';
import 'package:flutter_crud_localdb/bloc/form_bloc/form_state.dart';
import 'package:flutter_crud_localdb/bloc/list_bloc/list_bloc.dart';
import 'package:flutter_crud_localdb/bloc/list_bloc/list_event.dart';
import 'package:flutter_crud_localdb/bloc/list_bloc/list_state.dart';
import 'package:flutter_crud_localdb/data/model/form_model.dart';
import 'package:flutter_crud_localdb/widget/error_widget.dart';
import 'package:flutter_crud_localdb/widget/loading_indicator.dart';
import 'package:flutter_crud_localdb/widget/no_data_widget.dart';
import 'package:flutter_crud_localdb/widget/snackbar_widget.dart';

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
  FormsBloc? formsBloc;

  @override
  void initState() {
    formListBloc = BlocProvider.of<FormListBloc>(context);
    formsBloc = BlocProvider.of<FormsBloc>(context);
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
                child: BlocListener<FormsBloc, FormsStates>(
                  listenWhen: (previousState, state){
                    return state is Success;
                  },
                    listener: (context, state){
                    if(state.message!.isNotEmpty){
                      _scaffoldKey.currentState!.showSnackBar(snackBar(state.message!));
                    }
                  },
                  child: BlocBuilder<FormListBloc, FormListState>(
                    builder: (context, state){
                      if(state is FormListHasData){
                        return Container(
                          margin: const EdgeInsets.all(8),
                          child: (state.forms?.isNotEmpty ?? true ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.forms!.length,
                            itemBuilder: (context, index){
                              FormModel forms = state.forms![index];
                              return _formCard(forms, context);
                            },
                          ): NoData()),
                        );
                      }
                      if(state is FormListError){
                        return error(state.errorMessage);
                      }
                      return LoadingIndicator();
                    },
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  Card _formCard(FormModel forms, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
