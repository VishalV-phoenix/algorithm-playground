import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ComplexityGraph extends StatelessWidget {
  final List<FlSpot> theoreticalData;
  final List<FlSpot> experimentalData;

  final bool showTheoretical;
  final bool showExperimental;

  final double maxX;
  final double maxY;

  const ComplexityGraph({
    super.key,
    required this.theoreticalData,
    required this.experimentalData,
    required this.maxX,
    required this.maxY,
    this.showTheoretical = true,
    this.showExperimental = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
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

          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
          ),

          borderData: FlBorderData(show: true),

          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  return LineTooltipItem(
                    'Operations: ${spot.y.toStringAsFixed(1)}\n'
                    'Input Size: ${spot.x.toInt()}',
                    TextStyle(
                      color: spot.bar.color ?? Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList();
              },
            ),
          ),

          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            leftTitles: AxisTitles(
              axisNameWidget: const Text(
                "Operations",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              axisNameSize: 30,
              sideTitles: SideTitles(showTitles: true, reservedSize: 42),
            ),

            bottomTitles: AxisTitles(
              axisNameWidget: const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Input Size",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              axisNameSize: 40,
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final interval = maxX / 5;

                  if (value % interval > 1) {
                    return const SizedBox.shrink();
                  }

                  return Text(value.toInt().toString());
                },
              ),
            ),
          ),

          lineBarsData: [
            if (showTheoretical)
              LineChartBarData(
                spots: theoreticalData,
                isCurved: true,
                barWidth: 4,
                dotData: const FlDotData(show: false),
                color: Colors.blue,
              ),

            if (showExperimental)
              LineChartBarData(
                spots: experimentalData,
                isCurved: false,
                barWidth: 3,
                dotData: const FlDotData(show: true),
                color: Colors.red,
              ),
          ],
        ),
      ),
    );
  }
}
