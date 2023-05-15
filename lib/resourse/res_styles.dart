import 'package:flutter/material.dart';

class ResStyles {
  ResStyles._privateConstructor();

  static final ResStyles _instance = ResStyles._privateConstructor();

  static ResStyles get instance => _instance;

  factory ResStyles() {
    return _instance;
  }

  TextStyle get displayLarge => const TextStyle().copyWith();
  TextStyle get displayMedium => const TextStyle().copyWith();
  TextStyle get displaySmall => const TextStyle().copyWith();
  TextStyle get headlineLarge => const TextStyle().copyWith();
  TextStyle get headlineMedium => const TextStyle().copyWith();
  TextStyle get headlineSmall => const TextStyle().copyWith();
  TextStyle get titleLarge => const TextStyle().copyWith();
  TextStyle get titleMedium => const TextStyle().copyWith();
  TextStyle get titleSmall => const TextStyle().copyWith();
  TextStyle get bodyLarge => const TextStyle().copyWith();
  TextStyle get bodyMedium => const TextStyle().copyWith();
  TextStyle get bodySmall => const TextStyle().copyWith();
  TextStyle get labelLarge => const TextStyle().copyWith();
  TextStyle get labelMedium => const TextStyle().copyWith();
  TextStyle get labelSmall => const TextStyle().copyWith();
}
