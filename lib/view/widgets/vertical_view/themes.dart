import 'package:abox/const.dart';
import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    cardColor: AppColors().kblue,
    colorScheme: const ColorScheme.light(),
    tabBarTheme: TabBarTheme(
        overlayColor:
            MaterialStatePropertyAll(const ColorScheme.light().background),
        indicatorColor: AppColors().kblue,
        labelColor: AppColors().kblue,
        dividerColor: AppColors().kwhite),
    fontFamily: 'PlusJakartaSans',
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors().kblue),
    useMaterial3: true,
    primarySwatch: Colors.amber,
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(AppColors().kblack),
    )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors().kblack.withOpacity(0.8),
      foregroundColor: AppColors().kwhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(AppColors().kblue),
      foregroundColor: MaterialStatePropertyAll(AppColors().kblue),
    )),
    appBarTheme: const AppBarTheme(
        ),
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(),
      fontFamily: 'PlusJakartaSans',
      primarySwatch: Colors.amber,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(AppColors().kwhite),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors().kblue),
        foregroundColor: MaterialStatePropertyAll(AppColors().kblue),
      )),
      useMaterial3: true,
      tabBarTheme: TabBarTheme(
          overlayColor: MaterialStatePropertyAll(
            AppColors().kblue.withOpacity(0.0),
          ),
          indicatorColor: AppColors().kblue,
          labelColor: AppColors().kblue,
          dividerColor: AppColors().kwhite),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors().kwhite.withOpacity(0.8),
        foregroundColor: AppColors().kblack,
      ),
      colorScheme: const ColorScheme.dark(),
      appBarTheme: const AppBarTheme(
          ));
}
