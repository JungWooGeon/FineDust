import 'package:fine_dust/presentation/view/screen/air_quality_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entity/address.dart';
import '../../viewmodel/air_quality_viewmodel.dart';
import '../widget/air_quality_bar_chart_widget.dart';
import '../widget/dotted_line_widget.dart';
import '../widget/location_widget.dart';
import '../widget/lottie_air_quality_status_widget.dart';
import '../widget/row_air_quality_forecast_widget.dart';

class AirQualityScreen extends ConsumerWidget {

  final String title;
  final Address address;

  const AirQualityScreen({super.key, required this.title, required this.address});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final airQualityInfoState = ref.watch(airQualityViewModelProvider(address));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: airQualityInfoState.when(
        data: (airQualityData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LocationWidget(
                  streetAddress: airQualityData.address.streetAddress
              ),

              const SizedBox(width: 10, height: 10),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AirQualityDetailScreen(title: title, airQualityData: airQualityData)),
                  );
                },
                child: LottieAirQualityStatusWidget(
                  status: airQualityData.todayInfo.status,
                  width: 250,
                  height: 250,
                ),
              ),

              Text(
                airQualityData.todayInfo.status,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
              ),

              const SizedBox(height: 10),

              AirQualityBarChartWidget(
                pm10Value: airQualityData.todayInfo.pm10Value,
                pm25Value: airQualityData.todayInfo.pm25Value,
                status: airQualityData.todayInfo.status,
              ),

              const DottedLineWidget(),

              const SizedBox(height: 20),

              RowAirQualityForecastWidget(airQualityData: airQualityData)
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}