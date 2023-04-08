library logic4ads_ads;

import 'package:flutter/material.dart';
import 'package:logic4ads_ads/ads_widgets/banner_ads/banner_ad.dart';

enum AdType {
  bannerAd,
  nativeAd,
}

enum AdSize {
  smallBannerAd('360x50'),
  mediumBannerAd('360x70'),
  largeBannerAd('360x90');

  final String slug;
  const AdSize(this.slug);
}

class Logic4Ads extends StatelessWidget {
  const Logic4Ads({super.key, required this.adType, required this.adSize});
  final AdType adType;
  final AdSize adSize;
  static String publisherId = '';

  @override
  Widget build(BuildContext context) {
    if (adType == AdType.bannerAd) {
      return BannerAd(adSize: adSize);
    } else if (adType == AdType.nativeAd) {}
    return Container();
  }
}
