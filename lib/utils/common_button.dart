import 'package:flutter/material.dart';

import 'constants.dart';

class CommonButton{
  static mainButton({String text = 'text', Function()? onTap}){
    return InkWell(
    onTap: onTap ?? (){},
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: getRandomColor()
        ),
        child: Center(child: Text(text, style: googleFontStyle(color: Colors.white),)),
      ),
    );
  }
}