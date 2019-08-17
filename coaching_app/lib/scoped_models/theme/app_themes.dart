import 'package:flutter/material.dart';

enum AppTheme {
  RedLight ,
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
  BlackDark,
}

final appThemeData = {
  AppTheme.RedLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
  ),
  AppTheme.GreenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
  ),
  AppTheme.GreenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
  ),
  AppTheme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
  ),
  AppTheme.BlackDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
  ),
};