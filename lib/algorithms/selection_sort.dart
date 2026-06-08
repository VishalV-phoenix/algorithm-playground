import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

import '../data/algorithm.dart';

class SelectionSort extends Algorithm {
  @override
  String get name => "Selection Sort";

  @override
  String get category => "Sorting";

  @override
  String get bestCase => "O(n²)";

  @override
  String get averageCase => "O(n²)";

  @override
  String get worstCase => "O(n²)";

  @override
  String get spaceComplexity => "O(1)";

  @override
  String get explanation =>
      "Selection Sort repeatedly finds the minimum element from the unsorted portion and places it at the beginning.";

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

final selectionSort = SelectionSort();