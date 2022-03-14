import 'package:flutter/material.dart';

class WTheme {
  static ThemeData get myTheme {
    return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: const Color.fromRGBO(213, 0, 0, 1),
          ),
      appBarTheme: ThemeData()
          .appBarTheme
          .copyWith(backgroundColor: const Color.fromRGBO(242, 242, 242, 1)),
      // primaryColor: const Color.fromRGBO(242, 242, 242, 1),
      scaffoldBackgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          elevation: 2,
          primary: const Color.fromRGBO(213, 0, 0, 1),
          shape: const StadiumBorder(),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromRGBO(243, 242, 240, 1),
        elevation: 0,
        selectedItemColor: Color.fromRGBO(213, 0, 0, 1),
      ),

      fontFamily: 'Montserrat',
    );
  }
}
