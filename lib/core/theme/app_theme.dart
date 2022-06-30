import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme() => ThemeData(
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(
      0xFF22B07E, 
      <int, Color>{ 
        50: Color(0xffFFFFFF),
        100: Color(0xffE6F6F1),
        200: Color(0xffCEEDE2),
        300: Color(0xffB5E5D4),
        400: Color(0xff9DDCC6),
        500: Color(0xff84D3B7),
        600: Color(0xff6CCAA9),
        700: Color(0xff53C29B),
        800: Color(0xff3BB98C),
        900: Color(0xff22B07E), 
    }, 
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //elevation: 0,
      backgroundColor: Color(0xff22B07E),
      foregroundColor: Color(0xffFFFFFF)
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          width: 1.0,
          color: Color(0xFF22B07E)
        )
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: Color(0xFF22B07E),
          width: 1.2
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xFF22B07E),
          width: 1.2
        )
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xFF22B07E),
          width: 1.0
        )
      )
    ),
  );

  ThemeData darkTheme() => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: const MaterialColor(
      0xFF22B07E, 
      <int, Color>{ 
        50: Color(0xffFFFFFF),
        100: Color(0xffE6F6F1),
        200: Color(0xffCEEDE2),
        300: Color(0xffB5E5D4),
        400: Color(0xff9DDCC6),
        500: Color(0xff84D3B7),
        600: Color(0xff6CCAA9),
        700: Color(0xff53C29B),
        800: Color(0xff3BB98C),
        900: Color(0xff22B07E), 
    }, 
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //elevation: 0,
      backgroundColor: Color(0xff22B07E),
      foregroundColor: Color(0xffFFFFFF)
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          width: 1.0,
          color: Color(0xFF22B07E)
        )
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: Color(0xFF22B07E),
          width: 1.2
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xFF22B07E),
          width: 1.2
        )
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xFF22B07E),
          width: 1.0
        )
      )
    )
  );
}

// primary green 0xff22B07E
// secondary green 0xffC0E9DB