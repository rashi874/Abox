import 'package:abox/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0xFF1B7FED),
      brightness: Brightness.light,
      highlightColor: Colors.white,
      hintColor: const Color(0xFF9E9E9E),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF0079E3),
        secondary: Color(0xFF004C8E),
        tertiary: Color(0xFFF9D4A8),
        tertiaryContainer: Color(0xFFADC9F3),
        onTertiaryContainer: Color(0xFF0079E3),
        primaryContainer: Color(0xFF9AECC6),
        secondaryContainer: Color(0xFFF2F2F2),
      ),
      cardColor: AppColors().kblue,
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
      // scaffoldBackgroundColor: Colors.white,
      primaryColorDark: Colors.black,
      canvasColor: Colors.white,
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
      appBarTheme:
          const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark));

  static ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xFF1B7FED),
      brightness: Brightness.dark,
      highlightColor: const Color(0xFF252525),
      hintColor: const Color(0xFFc7c7c7),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF64BDF9),
        secondary: Color(0xFF78BDFC),
        tertiary: Color(0xFF865C0A),
        tertiaryContainer: Color(0xFF6C7A8E),
        onTertiaryContainer: Color(0xFF0F5835),
        primaryContainer: Color.fromARGB(255, 38, 27, 255),
        secondaryContainer: Color(0xFFF2F2F2),
      ),
      // scaffoldBackgroundColor: Colors.black,
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
      primaryColorDark: Colors.white,
      canvasColor: Colors.black,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ));
}
