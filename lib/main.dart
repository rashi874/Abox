import 'package:abox/controller/providers/ads_provider.dart';
import 'package:abox/view/widgets/screehome/mainscreen.dart';
import 'package:abox/view/widgets/vertical_view/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'controller/providers/edit_provider.dart';
import 'controller/providers/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
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
        title: 'Screenshot maker',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        home: const ScreenHome(),
      ),
    );
  }
}
