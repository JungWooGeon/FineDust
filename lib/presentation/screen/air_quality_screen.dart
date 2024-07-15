import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/air_quality_viewmodel.dart';

class AirQualityScreen extends ConsumerWidget {

  final String title;

  const AirQualityScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final airQualityInfoState = ref.watch(airQualityViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: airQualityInfoState.when(
        data: (airQualityData) {
          final int totalItems = airQualityData.todayInfo.length +
              airQualityData.forecastsInfo.length;
          return ListView.builder(
            itemCount: totalItems,
            itemBuilder: (context, index) {
              if (index < airQualityData.todayInfo.length) {
                final airQualityTodayInfo = airQualityData.todayInfo[index];
                return ListTile(
                  title: Text('Region: ${airQualityTodayInfo.region}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PM10: ${airQualityTodayInfo
                          .pm10Value}, Status: ${airQualityTodayInfo
                          .pm10Status}'),
                      Text('PM2.5: ${airQualityTodayInfo
                          .pm25Value}, Status: ${airQualityTodayInfo
                          .pm25Status}'),
                      Text('Last Updated: ${airQualityTodayInfo.lastUpdated}'),
                    ],
                  ),
                );
              } else {
                // forecastsInfo의 인덱스 계산
                final int forecastIndex = index -
                    airQualityData.todayInfo.length;
                final airQualityForecastInfo = airQualityData
                    .forecastsInfo[forecastIndex];
                return ListTile(
                  title: Text(
                      'Forecast Region: ${airQualityForecastInfo.region}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('region: ${airQualityForecastInfo.grade}'),
                      Text('grade: ${airQualityForecastInfo.grade}'),
                      Text('Date: ${airQualityForecastInfo.date}'),
                    ],
                  ),
                );
              }
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}