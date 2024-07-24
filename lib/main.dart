import 'package:fine_dust/presentation/view/screen/home_screen.dart';
import 'package:fine_dust/provider/api_url_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await dotenv.load();

  runApp(
    ProviderScope(
      overrides: [
        airQualityTodayUrlProvider.overrideWithValue(dotenv.env['AIR_QUALITY_TODAY_URL']!),
        airQualityForecastsUrlProvider.overrideWithValue(dotenv.env['AIR_QUALITY_FORECASTS_URL']!),
        weatherForecastsUrlProvider.overrideWithValue(dotenv.env['WEATHER_FORECASTS_URL']!),
        serviceKeyProvider.overrideWithValue(dotenv.env['SERVICE_KEY']!)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '미세 알리미',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
