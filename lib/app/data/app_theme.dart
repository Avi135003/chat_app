import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData myTheme = ThemeData(
    fontFamily: "Roxborough CF",
    primaryColor: const Color(0xff4E1564),
    primarySwatch: primaryMaterialColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff4E1564),
        ),
      ),
    ),
  );

}

MaterialColor primaryMaterialColor = const MaterialColor(
  4280916978,
  <int, Color>{
    50: Color.fromRGBO(
      41,
      155,
      242,
      .1,
    ),
    100: Color.fromRGBO(
      41,
      155,
      242,
      .2,
    ),
    200: Color.fromRGBO(
      41,
      155,
      242,
      .3,
    ),
    300: Color.fromRGBO(
      41,
      155,
      242,
      .4,
    ),
    400: Color.fromRGBO(
      41,
      155,
      242,
      .5,
    ),
    500: Color.fromRGBO(
      41,
      155,
      242,
      .6,
    ),
    600: Color.fromRGBO(
      41,
      155,
      242,
      .7,
    ),
    700: Color.fromRGBO(
      41,
      155,
      242,
      .8,
    ),
    800: Color.fromRGBO(
      41,
      155,
      242,
      .9,
    ),
    900: Color.fromRGBO(
      41,
      155,
      242,
      1,
    ),
  },
);