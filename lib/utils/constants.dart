 import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String mapIAccessToken = "b8f5d20027649c61f502a4a10f93fb1a";
 const String mapIRestApiKey = "b8f5d20027649c61f502a4a10f93fb1a";
 const String mapIAtlasClientId = "96dHZVzsAuttvPNUfKbvgMy1BfZj6RD-lcpCzMpnzjnPfwrIOiWxiEkgBS3xJeyzyQ3GFgapPpn3H_XZKdY7k4kwSGFUQWo2";
 const String mapIAtlasClientSecret = "lrFxI-iSEg_f_4mpQ9HbUeQBqfXL8-XMRcns-TQJAhKoDI3Sr4lPZ1UY3tM1iz6xkpzaenyL_EyAUkk7OB5VGa2f7aiTRhDhiIKZNKGMeXg=";

 final googleFontStyle = GoogleFonts.aBeeZee;

 getRandomColor()=>Colors.primaries[Random().nextInt(Colors.primaries.length)];