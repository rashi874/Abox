import 'package:abox/controller/providers/ads_provider.dart';
import 'package:abox/controller/providers/edit_provider.dart';
import 'package:abox/view/widgets/screehome/widgets/horizontal_recmnd_temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:abox/view/widgets/screehome/widgets/weekly_banner.dart';
import 'package:abox/view/widgets/screehome/const.dart';
import 'package:abox/view/widgets/screehome/widgets/recomende_temp.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AdsProvider().bottomBannerAd?.dispose();
      prov.createBottomBannerAd(context);

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
                  height: screenHeight / 2.4
                  ,
                  child: SvgPicture.asset(
                    'assets/images/Vector.svg',
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter,
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
                    width: 100,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.vertical_align_top_rounded,
                          color: Colors.red,
                        ),
                        kboxwidth5,
                        Text(
                          'S-maker',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  top: 100,
                  left: 20,
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      'Upgrade your screenshots. Instantly.',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 100,
                  left: 20,
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      'Simply Upload  your image. Edit it with a few clicks, then download the mock-up. There are Free templates available . ',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 60,
                  child: Image.asset(
                    'assets/images/phone.png',
                    height: 170,
                  ),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                kbox20,
                kbox10,
                Text(
                  'Stop sharing boring Screenshots.',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 62, vertical: 5),
              child: Text(
                'Instantly Upgrades your screenshots with backgrounds, window frames and subtle shadows with tons of ways to customize and make it your own. For your portfolio, team’s Slack channel, on Dribbble, anywhere!',
                // maxLines: 4,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
            ),

            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 320,
                  child: SvgPicture.asset(
                    'assets/images/Vectors.svg',
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter,
                  ),
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: SvgPicture.asset('assets/images/Vector.svg'),
                  //         fit: BoxFit.cover)),
                ),
                appservices.isBottomBannerAdLoaded
                    ? Positioned(
                        bottom: 90,
                        child: Material(
                          color: Colors.white.withOpacity(0.6),
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
                        ),
                      )
                    : const SizedBox(
                        // height: 1,
                        child: Text('Screenshot Maker'),
                      ),
                Positioned(
                    bottom: 20,
                    right: 16,
                    child: Card(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_rounded)))),
                Column(
                  children: const [
                    kbox20,
                    HorizontalRecomendedTemplates(),
                  ],
                ),
              ],
            ),
            // const HomeTopSection(),
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
            // Divider(),

            // const WeeklyBanner(),
            // const RecomendedTemplates(),

            // const HorizontalRecomendedTemplates(),
            // kbox20,
          ],
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
