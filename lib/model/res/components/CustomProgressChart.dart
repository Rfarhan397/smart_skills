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
            const AppTextWidget(
                text: 'Total Progress',
                fontSize: 16,
                fontWeight: FontWeight.w500),
            SizedBox(height: 4.h),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12.w,bottom: 2.8.h),
                    width: 100.w,

                    child: LineChart(
                      LineChartData(
                        minY: 0,
                        maxY: 140,
                        lineBarsData: [
                          LineChartBarData(
                            spots: getLineSpotsProblems(),
                            isCurved: true,
                            color: Colors.red.withOpacity(0.7),
                            barWidth: 2,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.red.withOpacity(0.1),
                            ),
                          ),
                          LineChartBarData(
                            spots: getLineSpotsServices(),
                            isCurved: true,
                            color: Colors.orangeAccent.withOpacity(0.7),
                            barWidth: 2,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.orangeAccent.withOpacity(0.1),
                            ),
                          ),
                        ],
                        titlesData: const FlTitlesData(show: false),
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                  BarChart(
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
                              return AppTextWidget(
                                text: '${value.toInt()}%',
                                textAlign: TextAlign.start,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const days = [
                                'Mon',
                                'Tue',
                                'Wed',
                                'Thu',
                                'Fri',
                                'Sat',
                                'Sun'
                              ];
                              return AppTextWidget(
                                text: days[value.toInt()],
                                textAlign: TextAlign.start,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: const FlGridData(show: true,   horizontalInterval: 20,  // Add this to ensure lines are drawn at every 20 units
                          drawVerticalLine: false),
                      barGroups: getBarGroups(),
                      borderData: FlBorderData(show: false),
                    ),
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LegendItem(color: Colors.red, text: 'Problems Report'),
                SizedBox(width: 1.w),
                LegendItem(color: Colors.orangeAccent, text: 'Services Report'),
                SizedBox(width: 1.w),
                LegendItem(
                    color: Colors.deepPurpleAccent, text: 'Bookings Report'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
List<FlSpot> getLineSpotsProblems() {
  return [
    const FlSpot(0, 40),
    const FlSpot(1, 60),
    const FlSpot(2, 40),
    const FlSpot(3, 50),
    const FlSpot(4, 40),
    const FlSpot(5, 50),
    const FlSpot(6, 120),
  ];
}
List<FlSpot> getLineSpotsServices() {
  return [
    const FlSpot(0, 105),
    const FlSpot(1, 65),
    const FlSpot(2, 85),
    const FlSpot(3, 45),
    const FlSpot(4, 125),
    const FlSpot(5, 55),
    const FlSpot(6, 25),
  ];
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
      BarChartRodData(toY: 120, color: AppColors.purplrColor, width: 22, borderRadius: BorderRadius.circular(4)),
    ]),
    BarChartGroupData(x: 5, barRods: [
      BarChartRodData(toY: 50, color: AppColors.purplrColor, width: 22, borderRadius: BorderRadius.circular(4)),
    ]),
    BarChartGroupData(x: 6, barRods: [
      BarChartRodData(toY: 20, color: AppColors.purplrColor, width: 22, borderRadius: BorderRadius.circular(4)),
    ]),
  ];
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
         SizedBox(width: 1.w),
        AppTextWidget(
            text: text,
            color: Colors.grey.shade700, fontSize: 8),
        SizedBox(width: 1.w),
      ],
    );
  }
}