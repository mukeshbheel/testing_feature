import 'package:flutter/material.dart';

import 'constants.dart';

class CommonSnackbar{
  static showSuccess({required context, required String message}){
    final snackbar = SnackBar(backgroundColor: Colors.green, content: Text(message, style: googleFontStyle(color: Colors.white),));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static showError({required context, required String message}){
    final snackbar = SnackBar(backgroundColor: Colors.red, content: Text(message, style: googleFontStyle(color: Colors.white),));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}