import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

String tPm10Value = "";
String tPm25Value = "";

class AirQualityBarChartWidget extends StatelessWidget {
  final String pm10Value;
  final String pm25Value;
  final String status;

  const AirQualityBarChartWidget(
      {Key? key,
      required this.pm10Value,
      required this.pm25Value,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    tPm10Value = double.parse(pm10Value).toStringAsFixed(1);
    tPm25Value = double.parse(pm25Value).toStringAsFixed(1);

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: SizedBox(
        height: 100,
        child: RotatedBox(
          quarterTurns: -3,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              maxY: 150,
              minY: 0,
              titlesData: const FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getTopTitles,
                      reservedSize: 30),
                ),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: getBottomTitles,
                    reservedSize: 100,
                  ),
                ),
              ),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: 150,
                      color: _getBarChartColor().withOpacity(0.2),
                      width: 22,
                      rodStackItems: [
                        BarChartRodStackItem(
                          0,
                          double.parse(pm10Value),
                          _getBarChartColor(),
                        )
                      ],
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      toY: 150,
                      color: _getBarChartColor().withOpacity(0.2),
                      width: 22,
                      rodStackItems: [
                        BarChartRodStackItem(
                          0,
                          double.parse(pm25Value),
                          _getBarChartColor(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  rotateAngle: 270,
                  getTooltipColor: (_) => Colors.blueGrey,
                  tooltipHorizontalAlignment: FLHorizontalAlignment.right,
                  tooltipMargin: -10,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    return BarTooltipItem(
                      rod.rodStackItems.first.toY.toString(),
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    );
                  },
                ),
              ),
            ),
            swapAnimationDuration: const Duration(milliseconds: 150),
            swapAnimationCurve: Curves.linear,
          ),
        ),
      ),
    );
  }

  Color _getBarChartColor() {
    switch (status) {
      case "매우나쁨":
        return Colors.black38;
      case "매우 나쁨":
        return Colors.black38;
      case "나쁨":
        return Colors.black38;
      case "좋음":
        return Colors.green;
      default:
        return Colors.green;
    }
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  Widget text;

  switch (value.toInt()) {
    case 0:
      text = const Text('미세먼지',
          textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
      break;
    case 1:
      text = const Text('초미세먼지',
          textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
      break;
    default:
      text = const Text('');
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: Transform.rotate(
      angle: 4.7, // Rotate 90 degrees counter-clockwise (in radians)
      child: Container(
        alignment: Alignment.centerLeft, // Align text to the left
        child: text,
      ),
    ),
  );
}

Widget getTopTitles(double value, TitleMeta meta) {
  Widget text;

  switch (value.toInt()) {
    case 0:
      text = Text(tPm10Value,
          textAlign: TextAlign.center, style: const TextStyle(fontSize: 10));
      break;
    case 1:
      text = Text(tPm25Value,
          textAlign: TextAlign.center, style: const TextStyle(fontSize: 10));
      break;
    default:
      text = const Text('');
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: Transform.rotate(
      angle: 4.7, // Rotate 90 degrees counter-clockwise (in radians)
      child: Container(
          alignment: Alignment.centerLeft, // Align text to the left
          child: text),
    ),
  );
}
