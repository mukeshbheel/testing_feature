import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract interface class PlatformLoader{
  Widget build();

  factory PlatformLoader(TargetPlatform platform){
    switch(platform){
      case TargetPlatform.android:
        return AndroidLoader();
      case TargetPlatform.iOS:
        return IOSLoader();
      default:
        return IOSLoader();
    }
  }
}

class AndroidLoader implements PlatformLoader{
  @override
  Widget build() {
    return CircularProgressIndicator();
  }
}

class IOSLoader implements PlatformLoader{
  @override
  Widget build() {
    return CupertinoActivityIndicator();
  }
}