import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logic4ads_ads/core/functions/go_to_url.dart';
import 'package:logic4ads_ads/core/models/image_ad.dart';
import 'package:logic4ads_ads/logic4ads_ads.dart';

class LargeBannerAd extends StatelessWidget {
  const LargeBannerAd({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadBannerAd(AdSize.largeBannerAd.slug),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const SizedBox();
          } else if (snapshot.hasData) {
            if (snapshot.data!.state == AdLoadState.failLoad) {
              return SizedBox(
                height: 90,
                width: 360,
                child: InkWell(
                  onTap: () {
                    goToUrl(snapshot.data!.targetUrl);
                  },
                  child: Image.network(snapshot.data!.imageUrl),
                ),
              );
            }
          }
        }
        return const SizedBox();
      },
    );
  }
}

Future<ImageAdModel> loadBannerAd(String slug) async {
  ImageAdModel adModel = ImageAdModel();
  // eyJpdiI6InNpK0U0SDNkOVhZVmxpSHo5MmZUQVE9PSIsInZhbHVlIjoiSWxvWWNPUnJtakVxWVdzYytUZHJHQT09IiwibWFjIjoiNDc1Zjg0OTI5ZjQ4ZDU2NDQxY2Q5ZWIwYTQ0MDYwMTRkYmIyYzdhMGQxMzI0ODMzOGQ0YTFkYjQ1ZjExNmUyZiJ9
  Uri uri = Uri.parse(
      'https://logic4ads.com/mobile-banner-ad/${Logic4Ads.publisherId}/$slug');
  var res = await http.get(uri);
  if (res.statusCode == 200) {
    Map<String, String> ad = Map<String, String>.from(json.decode(res.body));
    if (ad['state'] == 'success') {
      adModel = ImageAdModel(
        targetUrl: ad['url']!,
        imageUrl: ad['image']!,
      );
      return adModel;
    } else {
      return adModel;
    }
  } else {
    return adModel;
  }
}
