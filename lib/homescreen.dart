// import 'package:abox/controller/providers/provider.dart';
// import 'package:abox/open_ad.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:provider/provider.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late AppLifecycleReactor _appLifecycleReactor;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
//     _appLifecycleReactor =
//         AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     //   AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
//     //   _appLifecycleReactor =
//     //       AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
//     //   // super.initState();
//     // });

//     return Consumer<AppProvider>(builder: (context, appservices, _) {
//       return Scaffold(
//         // backgroundColor: const Color(0xFFf1f5fb),
//         // appBar: AppBar(
//         // systemOverlayStyle: const SystemUiOverlayStyle(
//         //   systemNavigationBarColor: Colors.blue, // navigation bar color
//         //   statusBarColor: Color(0xFFf1f5fb),
//         //   statusBarIconBrightness: Brightness.dark,
//         // ),
//         // elevation: 0,
//         // backgroundColor: const Color(0xFFf1f5fb),
//         // title: Row(
//         //   children: [
//         //     Image.asset(
//         //       logo,
//         //       height: 30,
//         //     ),
//         // CircleAvatar(
//         //   backgroundImage: AssetImage(logo),
//         // ),
//         // kboxwidth10,
//         // Text(
//         //   "ABOX",
//         //   style: TextStyle(
//         //     fontSize: 19,
//         //     fontWeight: FontWeight.bold,
//         //     letterSpacing: 0.5,
//         //     color: Color.fromARGB(255, 0, 0, 0),
//         //   ),
//         // ),
//         //   ],
//         // ),
//         // actions: <Widget>[
//         //   Padding(
//         //       padding: const EdgeInsets.only(right: 20.0),
//         //       child: GestureDetector(
//         //         onTap: () {},
//         //         child: const Icon(
//         //           Icons.settings_input_svideo_rounded,
//         //           color: Colors.black,
//         //           size: 26.0,
//         //         ),
//         //       )),
//         // ],
//         // ),
//         body: appservices.screens[appservices.index],
//         bottomNavigationBar: GNav(
//           // child: NavigationBar(
//           //   height: 70,
//           //   elevation: 0,
//           // backgroundColor: Colors.white,
//           // tabBackgroundColor: Colors.blue,
//           // padding: EdgeInsets.all(10),
//           activeColor: Colors.black,
//           gap: 8,
//           //   labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//           //   selectedIndex: appservices.index,
//           //   animationDuration: const Duration(seconds: 2),
//           onTabChange: (index) {
//             appservices.indexfunction(index);
//           },
//           tabs: const [
//             GButton(
//               icon: Icons.home_outlined,
//               text: 'Home',
//             ),
//             GButton(
//               icon: Icons.view_day_outlined,
//               text: 'Horizontal',
//             ),
//             GButton(
//               icon: Icons.vertical_shades_outlined,
//               text: 'Vertical',
//             ),
//             GButton(
//               icon: Icons.album_outlined,
//               text: 'About',
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
