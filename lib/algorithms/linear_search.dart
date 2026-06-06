import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

import '../data/algorithm.dart';

class LinearSearch extends Algorithm {
  @override
  String get name => "Linear Search";

  @override
  String get category => "Searching";

  @override
  String get bestCase => "O(1)";

  @override
  String get averageCase => "O(n)";

  @override
  String get worstCase => "O(n)";

  @override
  String get spaceComplexity => "O(1)";

  @override
  String get explanation =>
      "Linear Search checks each element one by one until the target is found.";

  @override
  List<int> get supportedInputSizes => [
        50,
        100,
        150,
      ];

  @override
  List<FlSpot> generateTheoreticalCurve(
    int inputSize,
  ) {
    return List.generate(
      inputSize,
      (index) => FlSpot(
        index.toDouble(),
        index.toDouble(),
      ),
    );
  }

  @override
  List<FlSpot> generateExperimentalData(
    int inputSize,
    int trials,
  ) {
    final random = Random();

    List<FlSpot> spots = [];

    for (int i = 0; i < trials; i++) {
      int targetPosition =
          random.nextInt(inputSize) + 1;

      spots.add(
        FlSpot(
          targetPosition.toDouble(),
          targetPosition.toDouble(),
        ),
      );
    }

    spots.sort(
      (a, b) => a.x.compareTo(b.x),
    );

    return spots;
  }
}

final linearSearch = LinearSearch();