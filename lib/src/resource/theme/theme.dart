import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.green,
    hintColor: Colors.grey,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.green,
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.green,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.green),
    colorScheme: base.colorScheme.copyWith(
      primary: Colors.green[700], // Background color of the ElevatedButton
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );
}

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: Colors.green[700],
    hintColor: Colors.grey,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.green[700],
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.green[700],
    ),
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.grey[800],
    iconTheme: IconThemeData(color: Colors.green[700]),
  );
}
