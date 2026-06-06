import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../data/algorithm.dart';

class GraphPage extends StatefulWidget {
  final Algorithm algorithm;

  const GraphPage({super.key, required this.algorithm});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  late int selectedInputSize;

  double trialCount = 10;

  List<FlSpot> theoreticalData = [];
  List<FlSpot> experimentalData = [];

  @override
  void initState() {
    super.initState();

    selectedInputSize = widget.algorithm.supportedInputSizes.first;

    refreshGraph();
  }

  void refreshGraph() {
    theoreticalData = widget.algorithm.generateTheoreticalCurve(
      selectedInputSize,
    );

    experimentalData = widget.algorithm.generateExperimentalData(
      selectedInputSize,
      trialCount.toInt(),
    );
  }

  double get maxY {
    final values = [
      ...theoreticalData.map((e) => e.y),
      ...experimentalData.map((e) => e.y),
    ];

    if (values.isEmpty) return 10;

    return values.reduce((a, b) => a > b ? a : b) * 1.2;
  }

  void showGraphInfoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Understanding This Graph"),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "• X-axis (Input Size)\n"
                  "Represents the number of elements being processed.",
                ),

                SizedBox(height: 12),

                Text(
                  "• Y-axis (Operations)\n"
                  "Represents the number of operations performed by the algorithm.",
                ),

                SizedBox(height: 12),

                Text(
                  "• Blue Line (Theoretical)\n"
                  "Shows the expected growth based on the algorithm's time complexity.",
                ),

                SizedBox(height: 12),

                Text(
                  "• Red Points (Experimental)\n"
                  "Shows results from simulated runs of the algorithm.",
                ),

                SizedBox(height: 12),

                Text(
                  "• Input Size Buttons\n"
                  "Change the maximum input size shown on the graph.",
                ),

                SizedBox(height: 12),

                Text(
                  "• Trials Slider\n"
                  "Controls how many experimental measurements are collected.",
                ),

                SizedBox(height: 12),

                Text(
                  "• Growth Trend\n"
                  "As input size increases, the graph extends along the X-axis and shows how the algorithm scales.",
                ),

                SizedBox(height: 12),

                Text(
                  "• Compare Theory and Practice\n"
                  "Compare the blue and red plots to see how theoretical complexity relates to actual behavior.",
                ),

                SizedBox(height: 12),

                Text(
                  "• Important\n"
                  "This graph helps compare how algorithms scale as input size increases. It focuses on growth patterns rather than exact running time.",
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Got it"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //--------------------------------------------------
          // TITLE
          //--------------------------------------------------
          Row(
            children: [
              const Text(
                "Complexity Curve",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(width: 8),

              IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.white),
                tooltip: "How to read this graph",
                onPressed: () {
                  showGraphInfoDialog();
                },
              ),
            ],
          ),

          //--------------------------------------------------
          // GRAPH
          //--------------------------------------------------
          Container(
            height: 280,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: theoreticalData.isEmpty
                    ? selectedInputSize.toDouble()
                    : theoreticalData.last.x,

                minY: 0,
                maxY: maxY * 1.1,

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
                        return Text(value.toInt().toString());
                      },
                    ),
                  ),
                ),

                lineBarsData: [
                  //--------------------------------
                  // THEORETICAL
                  //--------------------------------
                  LineChartBarData(
                    spots: theoreticalData,
                    isCurved: true,
                    barWidth: 4,
                    dotData: const FlDotData(show: false),
                    color: Colors.blue,
                  ),

                  //--------------------------------
                  // EXPERIMENTAL
                  //--------------------------------
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
          ),

          const SizedBox(height: 12),

          //--------------------------------------------------
          // LEGEND
          //--------------------------------------------------
          Row(
            children: [
              Container(width: 20, height: 4, color: Colors.blue),
              const SizedBox(width: 8),
              const Text("Theoretical", style: TextStyle(color: Colors.white)),
              const SizedBox(width: 24),
              Container(width: 20, height: 4, color: Colors.red),
              const SizedBox(width: 8),
              const Text("Experimental", style: TextStyle(color: Colors.white)),
            ],
          ),

          const SizedBox(height: 24),

          //--------------------------------------------------
          // INPUT SIZE
          //--------------------------------------------------
          const Text(
            "Input Size",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Wrap(
            spacing: 10,
            children: widget.algorithm.supportedInputSizes
                .map(
                  (size) => ChoiceChip(
                    label: Text(size.toString()),
                    selected: selectedInputSize == size,
                    onSelected: (_) {
                      setState(() {
                        selectedInputSize = size;

                        refreshGraph();
                      });
                    },
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 24),

          //--------------------------------------------------
          // TRIALS
          //--------------------------------------------------
          Text(
            "Trials: ${trialCount.toInt()}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          Slider(
            min: 1,
            max: 20,
            divisions: 19,
            value: trialCount,
            onChanged: (value) {
              setState(() {
                trialCount = value;

                refreshGraph();
              });
            },
          ),

          const SizedBox(height: 24),

          //--------------------------------------------------
          // EXPLANATION
          //--------------------------------------------------
          const Text(
            "Explanation",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            widget.algorithm.explanation,
            style: const TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 24),

          //--------------------------------------------------
          // COMPLEXITIES
          //--------------------------------------------------
          Card(
            child: ListTile(
              title: const Text("Best Case"),
              trailing: Text(widget.algorithm.bestCase),
            ),
          ),

          Card(
            child: ListTile(
              title: const Text("Average Case"),
              trailing: Text(widget.algorithm.averageCase),
            ),
          ),

          Card(
            child: ListTile(
              title: const Text("Worst Case"),
              trailing: Text(widget.algorithm.worstCase),
            ),
          ),

          Card(
            child: ListTile(
              title: const Text("Space Complexity"),
              trailing: Text(widget.algorithm.spaceComplexity),
            ),
          ),
        ],
      ),
    );
  }
}
