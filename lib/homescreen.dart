import 'package:abox/controller/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appservices, _) {
      return Scaffold(
        // backgroundColor: const Color(0xFFf1f5fb),
        // appBar: AppBar(
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   systemNavigationBarColor: Colors.blue, // navigation bar color
        //   statusBarColor: Color(0xFFf1f5fb),
        //   statusBarIconBrightness: Brightness.dark,
        // ),
        // elevation: 0,
        // backgroundColor: const Color(0xFFf1f5fb),
        // title: Row(
        //   children: [
        //     Image.asset(
        //       logo,
        //       height: 30,
        //     ),
        // CircleAvatar(
        //   backgroundImage: AssetImage(logo),
        // ),
        // kboxwidth10,
        // Text(
        //   "ABOX",
        //   style: TextStyle(
        //     fontSize: 19,
        //     fontWeight: FontWeight.bold,
        //     letterSpacing: 0.5,
        //     color: Color.fromARGB(255, 0, 0, 0),
        //   ),
        // ),
        //   ],
        // ),
        // actions: <Widget>[
        //   Padding(
        //       padding: const EdgeInsets.only(right: 20.0),
        //       child: GestureDetector(
        //         onTap: () {},
        //         child: const Icon(
        //           Icons.settings_input_svideo_rounded,
        //           color: Colors.black,
        //           size: 26.0,
        //         ),
        //       )),
        // ],
        // ),
        body: SafeArea(
          child: appservices.screens[appservices.index],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: const Color.fromARGB(223, 220, 110, 110),
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            height: 70,
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: appservices.index,
            animationDuration: const Duration(seconds: 2),
            onDestinationSelected: (index) {
              appservices.indexfunction(index);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.view_day_outlined),
                selectedIcon: Icon(Icons.view_day_rounded),
                label: 'Horizontal',
              ),
              NavigationDestination(
                icon: Icon(Icons.vertical_shades_outlined),
                selectedIcon: Icon(Icons.vertical_shades_rounded),
                label: 'Vertical',
              ),
              NavigationDestination(
                icon: Icon(Icons.wallet_outlined),
                selectedIcon: Icon(Icons.wallet),
                label: 'Featured',
              ),
            ],
          ),
        ),
      );
    });
  }
}
