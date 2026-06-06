import 'package:fl_chart/fl_chart.dart';

abstract class Algorithm {
  String get name;

  String get bestCase;
  String get averageCase;
  String get worstCase;
  String get spaceComplexity;

  String get explanation;

  // Available input sizes for this algorithm
  List<int> get supportedInputSizes;

  // Generate theoretical curve
  List<FlSpot> generateTheoreticalCurve(
    int inputSize,
  );

  // Generate measured curve
  List<FlSpot> generateExperimentalData(
    int inputSize,
    int trials,
  );
}