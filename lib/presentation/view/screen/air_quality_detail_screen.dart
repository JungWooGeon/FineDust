import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/air_quality_data.dart';
import '../widget/air_quality_bar_chart_widget.dart';
import '../widget/air_quality_detail_info_widget.dart';
import '../widget/dotted_line_widget.dart';
import '../widget/location_widget.dart';
import '../widget/row_air_quality_forecast_widget.dart';

class AirQualityDetailScreen extends StatelessWidget {
  final String title;
  final AirQualityData airQualityData;

  const AirQualityDetailScreen(
      {super.key, required this.title, required this.airQualityData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LocationWidget(
                  streetAddress: airQualityData.address.streetAddress),
              const SizedBox(height: 5),
              AirQualityBarChartWidget(
                pm10Value: airQualityData.todayInfo.pm10Value,
                pm25Value: airQualityData.todayInfo.pm25Value,
                status: airQualityData.todayInfo.status,
              ),
              const SizedBox(height: 5),
              RowAirQualityForecastWidget(airQualityData: airQualityData),
              const SizedBox(height: 20),
              const DottedLineWidget(),
              const SizedBox(height: 20),
              AirQualityDetailInfoWidget(airQualityData: airQualityData)
            ],
          ),
        ),
      ),
    );
  }
}
