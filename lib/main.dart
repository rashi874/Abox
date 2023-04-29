import 'package:abox/controller/providers/ads_provider.dart';
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
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.grey,
            // scaffoldBackgroundColor: Colors.grey[200],
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey[200],
            ),
            fontFamily: 'PlusJakartaSans'),
        home: const ScreenHome(),
      ),
    );
  }
}
