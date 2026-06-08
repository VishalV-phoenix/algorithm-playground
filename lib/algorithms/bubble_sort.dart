import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

import '../data/algorithm.dart';

class BubbleSort extends Algorithm {
  @override
  String get name => "Bubble Sort";

  @override
  String get category => "Sorting";

  @override
  String get bestCase => "O(n)";

  @override
  String get averageCase => "O(n²)";

  @override
  String get worstCase => "O(n²)";

  @override
  String get spaceComplexity => "O(1)";

  @override
  String get explanation =>
      "Bubble Sort repeatedly compares adjacent elements and swaps them when they are in the wrong order.";

  @override
  List<int> get supportedInputSizes => [
        20,
        50,
        100,
      ];

  @override
  List<FlSpot> generateTheoreticalCurve(
    int inputSize,
  ) {
    return List.generate(
      inputSize,
      (index) {
        final x = index + 1;

        return FlSpot(
          x.toDouble(),
          (x * x).toDouble(),
        );
      },
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
      final size =
          random.nextInt(inputSize) + 1;

      final operations =
          (size * size).toDouble() +
          random.nextDouble() * size;

      spots.add(
        FlSpot(
          size.toDouble(),
          operations,
        ),
      );
    }

    spots.sort(
      (a, b) => a.x.compareTo(b.x),
    );

    return spots;
  }
}

final bubbleSort = BubbleSort();