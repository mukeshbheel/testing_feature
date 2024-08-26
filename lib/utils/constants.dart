 import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String mapIAccessToken = "b8f5d20027649c61f502a4a10f93fb1a";
 const String mapIRestApiKey = "b8f5d20027649c61f502a4a10f93fb1a";
 const String mapIAtlasClientId = "96dHZVzsAuttvPNUfKbvgMy1BfZj6RD-lcpCzMpnzjnPfwrIOiWxiEkgBS3xJeyzyQ3GFgapPpn3H_XZKdY7k4kwSGFUQWo2";
 const String mapIAtlasClientSecret = "lrFxI-iSEg_f_4mpQ9HbUeQBqfXL8-XMRcns-TQJAhKoDI3Sr4lPZ1UY3tM1iz6xkpzaenyL_EyAUkk7OB5VGa2f7aiTRhDhiIKZNKGMeXg=";

 final googleFontStyle = GoogleFonts.aBeeZee;


 //---------------------------ludo constants----------------------------------------------->

 getRandomColor()=>Colors.primaries[Random().nextInt(Colors.primaries.length)];


 const String color00 = "firstColorLight";
 const String color01 = "firstColor";
 const String color02 = "firstColorDark";

 const String color10 = "secondColorLight";
 const String color11 = "secondColor";
 const String color12 = "secondColorDark";

 const String color20 = "thirdColorLight";
 const String color21 = "thirdColor";
 const String color22 = "thirdColorDark";

 const String color30 = "forthColorLight";
 const String color31 = "forthColor";
 const String color32 = "forthColorDark";

 const String colorWh = "whiteColor";
 const String colorBl = "blackColor";

 // --------------------------------flutter animations basics ----------------------->
 Widget pointItem({required String point})=>Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
   const Padding(
    padding: EdgeInsets.only(top: 8.0),
    child: Icon(Icons.circle, size: 10,),
   ),
   const SizedBox(width: 10,),
   Expanded(child: Text(point, style: googleFontStyle(),))
  ],
 );