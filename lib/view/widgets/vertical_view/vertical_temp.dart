import 'package:abox/ad_helper.dart';
import 'package:abox/view/widgets/vertical_view/verticle_editing.dart';
import 'package:flutter/material.dart';
import 'package:abox/view/widgets/screehome/const.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// ignore: must_be_immutable
class VerticleTemplates extends StatefulWidget {
  const VerticleTemplates({
    Key? key,
  }) : super(key: key);

  @override
  State<VerticleTemplates> createState() => _VerticleTemplatesState();
}

class _VerticleTemplatesState extends State<VerticleTemplates> {
  late BannerAd _inlineBannerAd;
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<AppProvider>(context, listen: false).load();
    // });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verticle templates',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: Color.fromARGB(255, 12, 12, 12),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              // scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerticleEditing(
                            bgscolor: colors[index],
                            image: homeshot,
                            appbartitle: text('Iphone 13 pro')[index],
                            mock: temp[index],
                          ),
                        ))),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 100,
                      // width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: colors[index],
                          width: .5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  text('Iphone 13 pro')[index],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.2,
                                    color: Color.fromARGB(255, 9, 8, 8),
                                  ),
                                ),
                                kbox2,
                                Row(
                                  children: [
                                    const Text(
                                      'Templates',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 68, 68, 68),
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    kboxwidth5,
                                    Icon(
                                      Icons.fiber_smart_record,
                                      size: 14,
                                      color: colors[index],
                                    ),
                                  ],
                                ),
                                kbox2,
                                const Text(
                                  'Try now Free',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 112, 112, 112),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                                color: colors[index],
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      left: 1.5,
                                      top: 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset(
                                          homeshot,
                                          height: 69,
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      temp[index],
                                      height: 70,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(
            // padding: const EdgeInsets.only(
            //   bottom: 10,
            // ),
            width: _inlineBannerAd.size.width.toDouble(),
            height: _inlineBannerAd.size.height.toDouble(),
            child: AdWidget(ad: _inlineBannerAd),
          ),
        ],
      ),
    );
  }

  void _createInlineBannerAd() {
    _inlineBannerAd = BannerAd(
      size: AdSize.mediumRectangle,
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _inlineBannerAd.load();
  }

  @override
  void initState() {
    super.initState();

    _createInlineBannerAd();
  }

  @override
  void dispose() {
    super.dispose();

    _inlineBannerAd.dispose();
  }
}
