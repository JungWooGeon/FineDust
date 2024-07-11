import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/weather_viewmodel.dart';

class WeatherScreen extends ConsumerWidget {

  final String title;

  const WeatherScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherInfoState = ref.watch(weatherViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: weatherInfoState.when(
        data: (weatherInfoList) => ListView.builder(
          itemCount: weatherInfoList.length,
          itemBuilder: (context, index) {
            final weatherInfo = weatherInfoList[index];
            return ListTile(
              title: Text('Region: ${weatherInfo.region}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PM10: ${weatherInfo.pm10Value}, Status: ${weatherInfo.pm10Status}'),
                  Text('PM2.5: ${weatherInfo.pm25Value}, Status: ${weatherInfo.pm25Status}'),
                  Text('Last Updated: ${weatherInfo.lastUpdated}'),
                ],
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}