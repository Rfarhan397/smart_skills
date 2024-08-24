import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smartyyy/model/res/constant/app_colors.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';

class CustomProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(text:
              'Total Progress',
              fontSize: 14, fontWeight: FontWeight.w700),
            SizedBox(height: 4.h),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 140,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 20,
                        getTitlesWidget: (value, meta) {
                          return AppTextWidget(text: '${value.toInt()}%',textAlign: TextAlign.start,color: Colors.grey,);
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                          return AppTextWidget(text:days[value.toInt()], textAlign: TextAlign.start,color: Colors.grey,);
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  barGroups: getBarGroups(),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LegendItem(color: Colors.red, text: 'Problems Report'),
                SizedBox(width: 1.w),
                LegendItem(color: Colors.orangeAccent, text: 'Services Report'),
                SizedBox(width: 1.w),
                LegendItem(color: Colors.deepPurpleAccent, text: 'Bookings Report'),
              ],
            )
            // Expanded(
            //   child: LineChart(
            //     LineChartData(
            //       maxY: 140,
            //       minY: 0,
            //       lineBarsData: [
            //         LineChartBarData(
            //           spots: getLineSpotsProblems(),
            //           isCurved: true,
            //           color: Colors.red,
            //           barWidth: 3,
            //           belowBarData: BarAreaData(
            //             show: true,
            //             color: Colors.red.withOpacity(0.3),
            //           ),
            //         ),
            //         LineChartBarData(
            //           spots: getLineSpotsServices(),
            //           isCurved: true,
            //           color: Colors.orange,
            //           barWidth: 3,
            //           belowBarData: BarAreaData(
            //             show: true,
            //             color: Colors.orange.withOpacity(0.3),
            //           ),
            //         ),
            //       ],
            //       titlesData: FlTitlesData(show: false),
            //       gridData: FlGridData(show: false),
            //       borderData: FlBorderData(show: false),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> getBarGroups() {
    return [
      BarChartGroupData(x: 0, barRods: [
        BarChartRodData(toY: 100, color: AppColors.purplrColor, width: 22, borderRadius: BorderRadius.circular(4)),
      ]),
      BarChartGroupData(x: 1, barRods: [
        BarChartRodData(toY: 60, color: AppColors.purplrColor, width: 22, borderRadius: BorderRadius.circular(4)),
      ]),
      BarChartGroupData(x: 2, barRods: [
        BarChartRodData(toY: 80, color: AppColors.purplrColor, width: 22, borderRadius: BorderRadius.circular(4)),
      ]),
      BarChartGroupData(x: 3, barRods: [
        BarChartRodData(toY: 40, color: AppColors.purplrColor, width: 22, borderRadius: BorderRadius.circular(4)),
      ]),
      BarChartGroupData(x: 4, barRods: [
        BarChartRodData(toY: 120, color:AppColors.purplrColor, width: 22, borderRadius: BorderRadius.circular(4)),
      ]),
      BarChartGroupData(x: 5, barRods: [
        BarChartRodData(toY: 50, color:AppColors.purplrColor, width: 22, borderRadius: BorderRadius.circular(4)),
      ]),
      BarChartGroupData(x: 6, barRods: [
        BarChartRodData(toY: 20, color: AppColors.purplrColor, width: 22, borderRadius: BorderRadius.circular(4)),
      ]),
    ];
  }

  List<FlSpot> getLineSpotsProblems() {
    return [
      FlSpot(0, 90),
      FlSpot(1, 60),
      FlSpot(2, 80),
      FlSpot(3, 90),
      FlSpot(4, 110),
      FlSpot(5, 70),
      FlSpot(6, 80),
    ];
  }

  List<FlSpot> getLineSpotsServices() {
    return [
      FlSpot(0, 70),
      FlSpot(1, 50),
      FlSpot(2, 60),
      FlSpot(3, 80),
      FlSpot(4, 90),
      FlSpot(5, 60),
      FlSpot(6, 100),
    ];
  }
}
class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 10),
        SizedBox(width: 4),
        AppTextWidget(
            text: text,
            color: Colors.grey.shade700, fontSize: 8),
      ],
    );
  }
}
