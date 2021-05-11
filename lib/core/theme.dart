import 'package:flutter/material.dart';

final kLightTheme = ThemeData.light().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(color: Colors.blue),
  errorColor: Colors.red,
  indicatorColor: Colors.yellow,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
  ),
);

final kDarkTheme = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(color: Colors.blueGrey),
  errorColor: Colors.red,
  indicatorColor: Colors.yellow,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
  ),
);
