// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      fontFamily: GoogleFonts.lato().fontFamily);

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);

  static  Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
}
