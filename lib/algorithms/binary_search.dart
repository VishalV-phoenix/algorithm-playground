import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

import '../data/algorithm.dart';

class BinarySearch extends Algorithm {
  @override
  String get name => "Binary Search";

  @override
  String get category => "Searching";

  @override
  String get bestCase => "O(1)";

  @override
  String get averageCase => "O(log n)";

  @override
  String get worstCase => "O(log n)";

  @override
  String get spaceComplexity => "O(1)";

  @override
  String get explanation =>
      "Binary Search works on sorted data. It repeatedly divides the search space in half until the target element is found.";

  @override
  List<int> get supportedInputSizes => [
        100,
        500,
        1000,
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
          log(x) / ln2,
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
      final target =
          random.nextInt(inputSize) + 1;

      final operations =
          (log(target) / ln2) +
          (random.nextDouble() * 0.5);

      spots.add(
        FlSpot(
          target.toDouble(),
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

final binarySearch = BinarySearch();