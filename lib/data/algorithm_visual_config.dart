import '../algorithms/binary_search_steps.dart';
import '../algorithms/linear_search_steps.dart';
import 'algorithm_code.dart';

class AlgorithmVisualConfig {
  final List<dynamic> steps;
  final List<String> codeLines;

  AlgorithmVisualConfig({
    required this.steps,
    required this.codeLines,
  });
}

AlgorithmVisualConfig getVisualConfig(
  String algorithm,
) {
  switch (algorithm) {
    case "Binary Search":
      return AlgorithmVisualConfig(
        steps: generateBinarySearchSteps(
          [1, 3, 5, 7, 9, 11, 13, 15],
          11,
        ),
        codeLines: binarySearchCode,
      );

    default:
      return AlgorithmVisualConfig(
        steps: generateLinearSearchSteps(
          [5, 8, 2, 9, 1, 7],
          9,
        ),
        codeLines: linearSearchCode,
      );
  }
}