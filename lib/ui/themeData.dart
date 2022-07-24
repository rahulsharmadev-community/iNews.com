// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color get primeryColor => const Color(0xff474CA0);

abstract class MyTheme {
  /// _colorSwatch method or function take RGB color as argument and after processing
  ///  it will return Map<int, Color> where int consist colors varients
  static Map<int, Color> _colorSwatch(
    int r,
    int g,
    int b,
  ) =>
      {
        50: Color.fromRGBO(r, g, b, 0.1),
        100: Color.fromRGBO(r, g, b, 0.2),
        200: Color.fromRGBO(r, g, b, 0.3),
        300: Color.fromRGBO(r, g, b, 0.4),
        400: Color.fromRGBO(r, g, b, 0.5),
        500: Color.fromRGBO(r, g, b, 0.6),
        600: Color.fromRGBO(r, g, b, 0.7),
        700: Color.fromRGBO(r, g, b, 0.8),
        800: Color.fromRGBO(r, g, b, 0.9),
        900: Color.fromRGBO(r, g, b, 1),
      };

  static ThemeData get defaultTheme => ThemeData(
      fontFamily: GoogleFonts.inter().fontFamily,
      primarySwatch: MaterialColor(0xff474CA0, _colorSwatch(67, 48, 67)),
      canvasColor: Colors.white,
      backgroundColor: Colors.white,
      primaryColor: const Color(0xff474CA0),
      indicatorColor: const Color(0xff474CA0),

//Radio Theme
      radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith(
              (state) => const Color(0xff474CA0))),
//SnackBar Theme
      snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xffd2d5ff),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
// OutlinedButton Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xff474CA0),
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      ),

//Card Theme
      cardTheme: CardTheme(
        color: const Color(0xff362C36),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
//AppBar Theme
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            // fontFamily: 'Rosarivo',
            color: Color(0xff474CA0),
          ),
          backgroundColor: Color(0xff201520),
          shadowColor: Color(0xff201520)),
      primaryTextTheme: _textTheme,
      textTheme: _textTheme);

  static const TextTheme _textTheme = TextTheme(
    // bodyText1: TextStyle(
    //   fontSize: 16,
    //   color: Color(0xff666666),
    // ),
    // bodyText2: TextStyle(fontSize: 16, color: Color(0xff666666)),

    bodyLarge: TextStyle(color: Color(0xff666666), fontSize: 24),
    bodyMedium: TextStyle(color: Color(0xff666666), fontSize: 18),
    bodySmall: TextStyle(color: Color(0xff666666), fontSize: 16),

    labelLarge: TextStyle(color: Color(0xff666666), fontSize: 14),
    labelMedium: TextStyle(color: Color(0xff666666), fontSize: 14),
    labelSmall: TextStyle(color: Color(0xff666666), fontSize: 14),

    titleLarge: TextStyle(
        color: Color(0xff666666), fontSize: 28, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(
        color: Color(0xff666666), fontSize: 26, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(
        color: Color(0xff666666), fontSize: 24, fontWeight: FontWeight.w600),

    displayLarge: TextStyle(
        color: Color(0xff474CA0), fontSize: 48, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        color: Color(0xff474CA0), fontSize: 44, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        color: Color(0xff474CA0), fontSize: 40, fontWeight: FontWeight.bold),
  );
}
