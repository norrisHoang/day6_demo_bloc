import 'package:flutter/material.dart';
import 'package:day5_demo/models/themes_app.dart';

class ThemeState {
  ThemeData? themeData;

  ThemeState(themeData);

}


class ThemeLight extends ThemeState {
  ThemeLight(themeData) : super(themeData) {

  }
}

class ThemeDark extends ThemeState {
  ThemeDark(themeData) : super(themeData) {
  }
}
