library logic4ads_ads;

import 'package:flutter/material.dart';
import 'package:logic4ads_ads/ads_widgets/banner_ads/large_banner.dart';

enum AdType {
  bannerAd,
  nativeAd,
}

enum AdSize {
  smallBannerAd,
  mediumBannerAd,
  largeBannerAd,
}

class Logic4Ads extends StatelessWidget {
  const Logic4Ads({super.key, required this.adType, required this.adSize});
  final AdType adType;
  final AdSize adSize;
  static String publisherId = '';

  @override
  Widget build(BuildContext context) {
    if (adType == AdType.bannerAd) {
      if (adSize == AdSize.largeBannerAd) {
        return LargeBannerAd();
      } else if (adSize == AdSize.mediumBannerAd) {
      } else if (adSize == AdSize.smallBannerAd) {}
    } else if (adType == AdType.nativeAd) {}
    return Container();
  }
}
