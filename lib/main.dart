import 'package:abox/controller/providers/ads_provider.dart';
import 'package:abox/controller/providers/edit_provider.dart';
import 'package:abox/controller/providers/provider.dart';
import 'package:abox/view/widgets/screehome/mainscreen.dart';
import 'package:abox/view/widgets/vertical_view/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // statusBarColor: Colors.transparent,
      ));
  runApp(const MyApp());
}

class BrightnessNotifier extends ValueNotifier<Brightness> {
  BrightnessNotifier(Brightness value) : super(value);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BrightnessNotifier brightnessNotifier =
        BrightnessNotifier(Theme.of(context).brightness);
    return ValueListenableBuilder<Brightness>(
        valueListenable: brightnessNotifier,
        builder: (BuildContext context, Brightness brightness, _) {
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
              ),
            ],
            child: MaterialApp(
              title: 'Screenshot maker',
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.dark,
              theme: ThemeClass.lightTheme,
              darkTheme: ThemeClass.darkTheme,
              home: const ScreenHome(),
              builder: (BuildContext context, Widget? child) {
                SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    systemNavigationBarColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.black,
                    statusBarIconBrightness:
                        Theme.of(context).brightness == Brightness.light
                            ? Brightness.dark
                            : Brightness.light,
                    systemNavigationBarIconBrightness:
                        Theme.of(context).brightness == Brightness.light
                            ? Brightness.dark
                            : Brightness.light,
                  ),
                );
                return child!;
              },
            ),
          );
        });
  }
}
