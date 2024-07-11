import 'package:fine_dust/presentation/screen/weather_screen.dart';
import 'package:fine_dust/provider/api_url_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await dotenv.load();

  runApp(
    ProviderScope(
      overrides: [
        apiUrlProvider.overrideWithValue(dotenv.env['BASE_URL']!),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(title: '미세 알리미'),
    );
  }
}
