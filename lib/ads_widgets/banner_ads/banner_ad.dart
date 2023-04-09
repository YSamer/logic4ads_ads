import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logic4ads_ads/core/functions/go_to_url.dart';
import 'package:logic4ads_ads/core/models/image_ad.dart';
import 'package:logic4ads_ads/logic4ads_ads.dart';

class BannerAd extends StatefulWidget {
  const BannerAd({super.key, required this.adSize});
  final AdSize adSize;

  @override
  State<BannerAd> createState() => _BannerAdState();
}

class _BannerAdState extends State<BannerAd> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      refersh();
    });
  }

  void refersh() {
    setState(() async {
      log('refresh');
      await loadBannerAd(AdSize.largeBannerAd.slug);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.adSize == AdSize.largeBannerAd
        ? 90
        : widget.adSize == AdSize.mediumBannerAd
            ? 70
            : 50;

    return FutureBuilder(
      future: loadBannerAd(AdSize.largeBannerAd.slug),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const SizedBox();
          } else if (snapshot.hasData) {
            if (snapshot.data!.state == AdLoadState.successLoad) {
              log(snapshot.data!.targetUrl);
              return SizedBox(
                height: height,
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
  String url = 'https://logic4ads.com/mobile-ad';
  Uri uri = Uri.parse(url);
  Map<String, String> body = {
    "appID_name": Logic4Ads.appIDName,
    "publisherId": Logic4Ads.publisherId,
    "slug": slug,
  };
  log(body.toString());
  var res = await http.post(uri, body: json.encode(body));
  log(res.body);
  if (res.statusCode == 200) {
    Map<String, String> ad = Map<String, String>.from(json.decode(res.body));
    if (ad['state'] == 'success') {
      adModel = ImageAdModel(
        state: AdLoadState.successLoad,
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
