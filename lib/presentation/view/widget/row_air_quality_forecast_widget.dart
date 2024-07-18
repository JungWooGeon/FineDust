import 'package:flutter/cupertino.dart';

import '../../model/air_quality_data.dart';
import 'lottie_air_quality_status_widget.dart';

class RowAirQualityForecastWidget extends StatelessWidget {
  static const forecastLabelList = ["오늘", "내일", "모레"];
  final AirQualityData airQualityData;

  const RowAirQualityForecastWidget({Key? key, required this.airQualityData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        3,
        (index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                forecastLabelList[index],
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 5),
              LottieAirQualityStatusWidget(
                status: airQualityData.forecastsInfo[index].grade,
                width: 100,
                height: 100,
              ),
              Text(
                airQualityData.forecastsInfo[index].grade,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
