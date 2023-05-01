import 'package:abox/controller/providers/ads_provider.dart';
import 'package:abox/controller/providers/edit_provider.dart';
import 'package:abox/open_ad.dart';
import 'package:abox/view/widgets/screehome/widgets/horizontal_recmnd_temp.dart';
import 'package:abox/view/widgets/tabscreen/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:abox/view/widgets/screehome/widgets/weekly_banner.dart';
import 'package:abox/const.dart';
import 'package:abox/view/widgets/screehome/widgets/verticle_rec_temp.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    final prov = Provider.of<AdsProvider>(context, listen: false);
    // late AppLifecycleReactor _appLifecycleReactor;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AdsProvider().bottomBannerAd?.dispose();
      prov.createBottomBannerAd(context);
      // AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
      // _appLifecycleReactor =
      //     AppLifecycleReactor(appOpenAdManager: appOpenAdManager);

      // @override
      // void initState() {
      //   super.initState();

      // }
    });

    return Consumer<AdsProvider>(builder: (context, appservices, _) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(),
        // appBar: AppBar(
        //   // surfaceTintColor: Colors.grey[200],
        //   centerTitle: true,
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   title: Text(
        //     'Screenshot Maker',
        //     style: TextStyle(
        //       fontSize: 19,
        //       fontWeight: FontWeight.bold,
        //       // letterSpacing: 0.5,
        //       color: Color.fromARGB(255, 0, 0, 0),
        //     ),
        //     textAlign: TextAlign.start,
        //   ),
        //   // actions: <Widget>[
        //   //   IconButton(
        //   //       onPressed: () => Navigator.push(
        //   //             context,
        //   //             MaterialPageRoute(
        //   //               builder: (context) => const AboutApp(),
        //   //             ),
        //   //           ),
        //   //       icon: const Icon(
        //   //         Icons.info_outline,
        //   //         color: Colors.black,
        //   //         size: 26.0,
        //   //       ))
        //   // ],
        // ),
        body: Column(
          // padding: EdgeInsets.zero,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: screenWidth,
                  height: screenHeight / 2.7,
                  child: SvgPicture.asset(
                    'assets/images/Vector.svg',
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                        const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.6),
                        BlendMode.dstOut),
                  ),
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: SvgPicture.asset('assets/images/Vector.svg'),
                  //         fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 60,
                  left: 10,
                  child: SizedBox(
                    width: screenWidth / 3,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.polymer,
                        ),
                        kboxwidth5,
                        Text(
                          'S-maker',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth / 1.5,
                        child: const Text(
                          'Upgrade your screenshots. Instantly.',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      kbox10,
                      SizedBox(
                        width: screenWidth / 1.8,
                        child: const Text(
                          'Simply Upload  your image. Edit it with a few clicks, then download the mock-up. There are Free templates available . ',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 80,
                  child: Image.asset(
                    'assets/images/phone.png',
                    height: screenHeight / 5.5,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                    colorBlendMode: BlendMode.dst,
                  ),
                ),
              ],
            ),

            // SizedBox(
            //   width: screenWidth / 1.1,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: const [
            //       Text(
            //         'Stop sharing boring Screenshots.',
            //         style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            //       ),
            //       kbox10,
            //       Text(
            //         'Instantly Upgrades your screenshots with backgrounds, window frames and subtle shadows with tons of ways to customize and make it your own. For your portfolio, team’s Slack channel, on Dribbble, anywhere!',
            //         // maxLines: 4,
            //         overflow: TextOverflow.fade,
            //         style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            //       ),
            //     ],
            //   ),
            // ),

            // SizedBox(
            //   height: 100,
            //   child: ListView.builder(
            //       itemCount: colors.length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(3.0),
            //           child: CircleAvatar(
            //             radius: 25,
            //             backgroundColor: colors[index],
            //           ),
            //         );
            //       }),
            // ),
            const HorizontalRecomendedTemplates(),
            const VerticleRecTemplates(),
            // Card(
            //     child: IconButton(
            //         onPressed: () {},
            //         icon: const Icon(Icons.arrow_forward_rounded))),
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: SvgPicture.asset('assets/images/Vector.svg'),
                //         fit: BoxFit.cover)),
                SizedBox(
                  width: screenWidth,
                  height: screenHeight / 5,
                  child: SvgPicture.asset(
                    'assets/images/Vectors.svg',
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                        const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.6),
                        BlendMode.dstOut),
                  ),
                ),
                appservices.isBottomBannerAdLoaded
                    ? Material(
                        color: AppColors().kblue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            height: appservices.bottomBannerAd?.size.height
                                .toDouble(),
                            width: appservices.bottomBannerAd?.size.width
                                .toDouble(),
                            child: AdWidget(ad: appservices.bottomBannerAd!),
                          ),
                        ),
                      )
                    : const SizedBox(
                        // height: 1,
                        child: Text('AD'),
                      ),
              ],
            ),
            // const HomeTopSection(),

            // Divider(),

            // const WeeklyBanner(),

            // const HorizontalRecomendedTemplates(),
            // kbox20,
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Tabscreen()),
            );
          },
          child: const Icon(
            Icons.arrow_forward_rounded,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    AdsProvider().bottomBannerAd?.dispose();
  }
}
