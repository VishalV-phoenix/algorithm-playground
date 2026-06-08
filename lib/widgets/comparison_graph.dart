import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ComparisonGraph extends StatelessWidget {
  final List<FlSpot> algorithmAData;
  final List<FlSpot> algorithmBData;

  final String algorithmAName;
  final String algorithmBName;

  final bool showAlgorithmA;
  final bool showAlgorithmB;

  const ComparisonGraph({
    super.key,
    required this.algorithmAData,
    required this.algorithmBData,
    required this.algorithmAName,
    required this.algorithmBName,
    required this.showAlgorithmA,
    required this.showAlgorithmB,
  });

  double get maxX {
    final values = [
      ...algorithmAData.map((e) => e.x),
      ...algorithmBData.map((e) => e.x),
    ];

    if (values.isEmpty) return 100;

    return values.reduce((a, b) => a > b ? a : b);
  }

  double get maxY {
    final values = [
      ...algorithmAData.map((e) => e.y),
      ...algorithmBData.map((e) => e.y),
    ];

    if (values.isEmpty) return 10;

    return values.reduce((a, b) => a > b ? a : b) * 1.2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: maxX,
          minY: 0,
          maxY: maxY,

          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (spots) {
                return spots.map((spot) {
                  return LineTooltipItem(
                    "${spot.x.toInt()}\n${spot.y.toStringAsFixed(1)}",
                    TextStyle(
                      color: spot.bar.color ?? Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList();
              },
            ),
          ),

          borderData: FlBorderData(show: true),

          gridData: FlGridData(show: true),

          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),

          lineBarsData: [
            if (showAlgorithmA)
              LineChartBarData(
                spots: algorithmAData,
                isCurved: true,
                barWidth: 4,
                color: Colors.blue,
                dotData: const FlDotData(show: true),
              ),

            if (showAlgorithmB)
              LineChartBarData(
                spots: algorithmBData,
                isCurved: true,
                barWidth: 4,
                color: Colors.green,
                dotData: const FlDotData(show: true),
              ),
          ],
        ),
      ),
    );
  }
}
