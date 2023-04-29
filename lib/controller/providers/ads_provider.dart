import 'package:abox/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsProvider with ChangeNotifier {
  RewardedAd? rewardedAd;
  BannerAd? bottomBannerAd;
  bool isBottomBannerAdLoaded = false;
  bool isinlineBannerAdAdLoaded = false;
  BannerAd? inlineBannerAd;

  void createInlineBannerAd(context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());
    inlineBannerAd = BannerAd(
      size: size!,
      // size: AdSize.mediumRectangle,
      adUnitId: AdHelper.bannerAdUnitId2,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isinlineBannerAdAdLoaded = true;
          notifyListeners();
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    inlineBannerAd?.load();
    notifyListeners();
  }

  void createInlineBannerAd3(context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());
    inlineBannerAd = BannerAd(
      // size: size!,
      size: AdSize.mediumRectangle,
      adUnitId: AdHelper.bannerAdUnitId2,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isinlineBannerAdAdLoaded = true;
          notifyListeners();
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    inlineBannerAd?.load();
    notifyListeners();
  }

  void createBottomBannerAd(context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());

    bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      // size: size!,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBottomBannerAdLoaded = true;
          notifyListeners();
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    bottomBannerAd?.load();
    notifyListeners();
  }

  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              notifyListeners();
              ad.dispose();
              rewardedAd = null;
              notifyListeners();

              loadRewardedAd();
            },
          );

          rewardedAd = ad;
          notifyListeners();
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }
}