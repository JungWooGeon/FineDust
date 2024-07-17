import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/air_quality_viewmodel.dart';
import '../widget/air_quality_bar_chart_widget.dart';
import '../widget/dashed_line_painter_widget.dart';
import '../widget/lottie_air_quality_status_widget.dart';

class AirQualityScreen extends ConsumerWidget {

  final String title;

  const AirQualityScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final airQualityInfoState = ref.watch(airQualityViewModelProvider);

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
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 24,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      airQualityData.address.streetAddress,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10, height: 10),
              LottieAirQualityStatusWidget(status: airQualityData.todayInfo.status),
              Text(
                airQualityData.todayInfo.status,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  height: 100,
                  child:  AirQualityBarChart(),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 1, // 점선의 높이
                  child: CustomPaint(
                    painter: DashedLinePainter(),
                  ),
                )
              )
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}