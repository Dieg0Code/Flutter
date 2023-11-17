import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedTheme;

  AppTheme({this.selectedTheme = 0})
      : assert(
          selectedTheme >= 0 && selectedTheme <= _colorThemes.length - 1,
          'Selected theme must be between 0 and ${_colorThemes.length - 1}',
        );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedTheme],
      // brightness: Brightness.dark
    );
  }
}
