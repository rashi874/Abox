import 'package:abox/ad_helper.dart';
import 'package:abox/view/widgets/about_screen/about_screen.dart';
import 'package:abox/view/widgets/screehome/widgets/home_top_section.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:abox/view/widgets/screehome/widgets/weekly_banner.dart';
import 'package:abox/view/widgets/screehome/const.dart';
import 'package:abox/view/widgets/screehome/widgets/recomende_temp.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late BannerAd _bottomBannerAd;
  bool _isBottomBannerAdLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(avatar),
              ),
              kboxwidth10,
              Text(
                'Helloo.',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.start,
              ),
              kboxwidth10,
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutApp(),
                    ),
                  ),
              icon: const Icon(
                Icons.info_outline,
                color: Colors.black,
                size: 26.0,
              ))
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const HomeTopSection(),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: colors.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: colors[index],
                      ),
                    );
                  }),
            ),
            _isBottomBannerAdLoaded
                ? SizedBox(
                    height: _bottomBannerAd.size.height.toDouble(),
                    width: _bottomBannerAd.size.width.toDouble(),
                    child: AdWidget(ad: _bottomBannerAd),
                  )
                : const SizedBox(),
            kbox10,
            const WeeklyBanner(),
            const RecomendedTemplates(),
            kbox20,
          ],
        ),
      ),
    );
  }

  void _createBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBottomBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _bottomBannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    _createBottomBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd.dispose();
  }
}
