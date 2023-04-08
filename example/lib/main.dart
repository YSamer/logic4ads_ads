import 'package:flutter/material.dart';
import 'package:logic4ads_ads/logic4ads_ads.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Logic4Ads.publisherId =
        'eyJpdiI6Im9YdTJ6TmtXZTM4M1RDalFYWnVIVWc9PSIsInZhbHVlIjoiSlVjQmxmb3lGZnNmUGpvNm44elBaQT09IiwibWFjIjoiMzA1NmNjY2ZkYzdlNWZhMzI0OTg0MjU4MWJiOTVlYjMwODI4ZGY0NTAyNmU3NTFkNGU1YTdiYjdlOTk3ZTNhZSJ9';
    return Scaffold(
      body: Container(),
      bottomNavigationBar: const Logic4Ads(
          adType: AdType.bannerAd, adSize: AdSize.largeBannerAd),
    );
  }
}
