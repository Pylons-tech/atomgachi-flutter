import 'package:flutter/material.dart';

final ThemeData kTheme = _buildTheme();

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}