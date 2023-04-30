import 'package:abox/controller/providers/ads_provider.dart';
import 'package:abox/view/widgets/screehome/const.dart';
import 'package:abox/view/widgets/screehome/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:abox/homescreen.dart';
import 'controller/providers/edit_provider.dart';
import 'controller/providers/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarIconBrightness: Brightness.dark,
  //     systemNavigationBarColor: Colors.white,
  //     systemNavigationBarIconBrightness: Brightness.dark,
  //     systemNavigationBarDividerColor: Colors.white,
  //     statusBarColor: Colors.white,
  //     statusBarBrightness: Brightness.dark,
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
        ListenableProvider(
          create: (context) => EditProvider(),
        ),
        ListenableProvider(
          create: (context) => AdsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,

        //  ThemeData(
        //     visualDensity: VisualDensity.adaptivePlatformDensity,
        //     primarySwatch: Colors.grey,

        //     // scaffoldBackgroundColor: Colors.grey[200],
        //     scaffoldBackgroundColor: Colors.white,
        //     useMaterial3: true,
        //     appBarTheme: AppBarTheme(
        //       backgroundColor: Colors.grey[200],
        //     ),
        //     fontFamily: 'PlusJakartaSans'),
        home: const ScreenHome(),
      ),
    );
  }
}

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      // scaffoldBackgroundColor: Colors.white,
      cardColor: AppColors().kblue,
      colorScheme: ColorScheme.light(),
      fontFamily: 'PlusJakartaSans',
      useMaterial3: true,
      primarySwatch: Colors.amber,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors().kblue),
        foregroundColor: MaterialStatePropertyAll(AppColors().kwhite),
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
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
      ),
      typography: Typography(black: Typography.blackCupertino));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      // scaffoldBackgroundColor: Colors.black,
      fontFamily: 'PlusJakartaSans',
      primarySwatch: Colors.amber,
      // cardColor: ThemeData.light()
      //     .copyWith(
      //       cardColor: AppColors().kblue,
      //     )
      //     .cardColor,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors().kblue),
        foregroundColor: MaterialStatePropertyAll(AppColors().kblue),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors().kblue),
        foregroundColor: MaterialStatePropertyAll(AppColors().kblue),
      )),
      useMaterial3: true,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors().kwhite.withOpacity(0.8),
        foregroundColor: AppColors().kblue,
      ),
      colorScheme: ColorScheme.dark(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ));
}
