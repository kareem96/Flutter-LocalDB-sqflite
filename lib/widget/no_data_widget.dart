



import 'package:flutter/material.dart';

class NoData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Text('No Data'),
    );
  }
}
