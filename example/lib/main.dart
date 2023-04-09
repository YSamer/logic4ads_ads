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
    Logic4Ads.appIDName = "com.example.example";
    Logic4Ads.publisherId =
        'eyJpdiI6IlYwayt2VktXeXExVjBrR2srakVrVUE9PSIsInZhbHVlIjoiZWdQK3h4MkdaeUIyTmU2UW5ZMThsZz09IiwibWFjIjoiNTdiN2U0ODU0Y2UxZDUzNDZjMTk5NTFmNGMwZDU4ZWIzYzRiNGU3OWUyZDg4Nzc4YTE5OGNhZGNlZWI0ZDk1YyJ9';
    return Scaffold(
      body: Container(),
      bottomNavigationBar: const Logic4Ads(
          adType: AdType.bannerAd, adSize: AdSize.largeBannerAd),
    );
  }
}
