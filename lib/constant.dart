import 'package:flutter/material.dart';

Color hexColor(String colorhex) {
  String colornew = '0xFF' + colorhex;
  colornew = colornew.replaceAll('#', '');
  int colorint = int.parse(colornew);
  return Color(colorint);
}
