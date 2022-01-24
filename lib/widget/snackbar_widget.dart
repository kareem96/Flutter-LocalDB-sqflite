



import 'package:flutter/material.dart';

SnackBar snackBar(String message){
  return SnackBar(content: Text(message), duration: (const Duration(seconds: 1)),);
}