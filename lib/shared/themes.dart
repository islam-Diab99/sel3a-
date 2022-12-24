import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/constants.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: defaultColor,
  primaryColor: defaultColor,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
  ),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white),
    color: HexColor('333739'),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: HexColor('333739'),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
    selectedItemColor: defaultColor,
    type: BottomNavigationBarType.fixed,
  ),
);
ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  primaryColor: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      color: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
  fontFamily: 'jannah',
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
    selectedItemColor: defaultColor,
    type: BottomNavigationBarType.fixed,
  ),
);
