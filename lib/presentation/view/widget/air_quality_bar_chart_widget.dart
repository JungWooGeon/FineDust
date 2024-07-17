import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AirQualityBarChart extends StatelessWidget {
  const AirQualityBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -3,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          maxY: 150,
          minY: 0,
          titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getBottomTitles,
                  reservedSize: 100
              ),
            ),
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 150,
                  color: Colors.green.withOpacity(0.2),
                  width: 22,
                  rodStackItems: [
                    BarChartRodStackItem(
                      0,
                      30,
                      Colors.green,
                    )
                  ]
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 150,
                  color: Colors.green.withOpacity(0.2),
                  width: 22,
                  rodStackItems: [
                    BarChartRodStackItem(
                      0,
                      30,
                      Colors.green,
                    )
                  ]
                )
              ],
            ),
          ],
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
        ),
        swapAnimationDuration: const Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
          '미세먼지',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14)
      );
      break;
    case 1:
      text = const Text(
          '초미세먼지',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14)
      );
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
        child: text
      ),
    ),
  );
}
