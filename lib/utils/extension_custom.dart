import 'package:flutter/material.dart';

extension ChildrenGap on List<Widget> {
  List<Widget> addGap(Widget element) {
    List<Widget> list = [];
    for (int i = 0; i < length; i++) {
      list.add(this[i]);
      if (i != length - 1) {
        list.add(element);
      }
    }
    return list;
  }
}