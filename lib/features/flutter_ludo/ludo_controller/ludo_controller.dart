import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/features/flutter_ludo/ludo_piece.dart';

import '../../../utils/constants.dart';

class LudoController extends GetxController{
  Rx<LudoPiece> greenPiece1 = LudoPiece(id: 1, colorName: "green", offset: Offset(0,0)).obs;

  List<List<String>> gridState = [
    [color00, color00, color00, color00, color00, color00, colorWh, colorWh, colorWh, color10, color10, color10, color10, color10, color10],
    [color00, color01, color01, color01, color01, color00, colorWh, color11, color11, color10, color11, color11, color11, color11, color10],
    [color00, color01, color02, color02, color01, color00, colorBl, color11, colorWh, color10, color11, color12, color12, color11, color10],
    [color00, color01, color02, color02, color01, color00, colorWh, color11, colorWh, color10, color11, color12, color12, color11, color10],
    [color00, color01, color01, color01, color01, color00, colorWh, color11, colorWh, color10, color11, color11, color11, color11, color10],
    [color00, color00, color00, color00, color00, color00, colorWh, color11, colorWh, color10, color10, color10, color10, color10, color10],
    [colorWh, color01, colorWh, colorWh, colorWh, colorWh, colorBl, colorBl, colorBl, colorWh, colorWh, colorWh, colorBl, colorWh, colorWh],
    [colorWh, color01, color01, color01, color01, color01, colorBl, colorBl, colorBl, color31, color31, color31, color31, color31, colorWh],
    [colorWh, colorWh, colorBl, colorWh, colorWh, colorWh, colorBl, colorBl, colorBl, colorWh, colorWh, colorWh, colorWh, color31, colorWh],
    [color20, color20, color20, color20, color20, color20, colorWh, color21, colorWh, color30, color30, color30, color30, color30, color30],
    [color20, color21, color21, color21, color21, color20, colorWh, color21, colorWh, color30, color31, color31, color31, color31, color30],
    [color20, color21, color22, color22, color21, color20, colorWh, color21, colorWh, color30, color31, color32, color32, color31, color30],
    [color20, color21, color22, color22, color21, color20, colorWh, color21, colorBl, color30, color31, color32, color32, color31, color30],
    [color20, color21, color21, color21, color21, color20, color21, color21, colorWh, color30, color31, color31, color31, color31, color30],
    [color20, color20, color20, color20, color20, color20, colorWh, colorWh, colorWh, color30, color30, color30, color30, color30, color30],
  ];


  initState(){
    final width = Get.size.width;
    final boxWidth = Get.size.width/15;
    greenPiece1.value = LudoPiece(id: 1, colorName: "green", offset: Offset(boxWidth*2, boxWidth*2));

  }
}