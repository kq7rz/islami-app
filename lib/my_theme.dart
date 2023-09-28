import 'package:flutter/material.dart';

class MyTheme {
  ///colors , light mode , dark mode
  static const Color primaryLight = Color(0xffB7935F);
  static const Color blackColor = Color(0xff272723);
  static const Color whiteColor = Color(0xffffffff);
  static const Color primaryDark = Color(0xff141A2E);
  static const Color yellowColor = Color(0xffFACC1D);

  static ThemeData lightMode = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: blackColor, size: 24)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        unselectedItemColor: whiteColor,
        selectedIconTheme: IconThemeData(size: 45)),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: MyTheme.whiteColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ))),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData darkMode = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: whiteColor, size: 24)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        unselectedItemColor: whiteColor,
        selectedIconTheme: IconThemeData(size: 45)),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: MyTheme.blackColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ))),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor),
      titleMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: whiteColor),
      titleSmall: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: yellowColor),
    ),
  );
}
