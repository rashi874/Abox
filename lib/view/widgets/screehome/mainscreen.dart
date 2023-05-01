import 'package:abox/controller/providers/ads_provider.dart';
import 'package:abox/view/widgets/screehome/widgets/horizontal_recmnd_temp.dart';
import 'package:abox/view/widgets/tabscreen/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    final prov = Provider.of<AdsProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AdsProvider().bottomBannerAd?.dispose();
      prov.createBottomBannerAd(context);
    });

    return Consumer<AdsProvider>(builder: (context, appservices, _) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Column(
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
            const HorizontalRecomendedTemplates(),
            const VerticleRecTemplates(),
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SizedBox(
                  width: screenWidth,
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
