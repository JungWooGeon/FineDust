import 'package:flutter/cupertino.dart';

import '../../model/air_quality_data.dart';

class AirQualityDetailInfoWidget extends StatelessWidget {
  final AirQualityData airQualityData;

  const AirQualityDetailInfoWidget({super.key, required this.airQualityData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          tableRowInfo("아황산가스", airQualityData.todayInfo.so2Value, true),
          const SizedBox(height: 20),
          tableRowInfo("일산화탄소", airQualityData.todayInfo.coValue, true),
          const SizedBox(height: 20),
          tableRowInfo("오존", airQualityData.todayInfo.o3Value, true),
          const SizedBox(height: 20),
          tableRowInfo("이산화질소", airQualityData.todayInfo.no2Value, true),
          const SizedBox(height: 20),
          tableRowInfo("측정 시간", airQualityData.todayInfo.lastUpdated, false),
        ],
      ),
    );
  }
}

Widget tableRowInfo(String title, String value, bool ppm) {
  return Table(
    columnWidths: const {
      0: FlexColumnWidth(2),
      1: FlexColumnWidth(3),
      2: FixedColumnWidth(40), // 'ppm' 텍스트를 위한 고정 너비
    },
    children: [
      TableRow(
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          Text(value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          ppm
              ? Text("ppm",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
              : Container(),
        ],
      ),
    ],
  );
}
