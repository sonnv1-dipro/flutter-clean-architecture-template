import 'package:flutter/material.dart';

class ResColors {
  Brightness _brightness = Brightness.light;

  ResColors._privateConstructor();

  static final ResColors _instance = ResColors._privateConstructor();

  static ResColors get instance => _instance;

  set brightness(value) {
    _brightness = value;
  }

  factory ResColors() {
    return _instance;
  }

  ThemeData get _theme => ThemeData(brightness: _brightness);

  Color get dialogBackgroundColor => _theme.dialogBackgroundColor;

  Color get disabledColor => _theme.disabledColor;

  Color get dividerColor => _theme.dividerColor;

  Color get focusColor => _theme.focusColor;

  Color get highlightColor => _theme.highlightColor;

  Color get hintColor => _theme.hintColor;

  Color get hoverColor => _theme.hoverColor;

  Color get indicatorColor => _theme.indicatorColor;

  Color get primaryColor => _theme.primaryColor;

  Color get primaryColorDark => _theme.primaryColorDark;

  Color get primaryColorLight => _theme.primaryColorLight;

  Color get scaffoldBackgroundColor => _theme.scaffoldBackgroundColor;

  Color get secondaryHeaderColor => _theme.secondaryHeaderColor;
}
