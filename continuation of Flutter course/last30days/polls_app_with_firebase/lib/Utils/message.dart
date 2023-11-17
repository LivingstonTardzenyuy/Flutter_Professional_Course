import 'package:flutter/material.dart';
import 'package:polls_app_with_firebase/styles/colors.dart';

void error(BuildContext? context, {required String message}){
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(message), backgroundColor: AppColors.red,));
}


void success(BuildContext? context, {required String message}){
ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(message), backgroundColor: AppColors.primaryColor,));
}


