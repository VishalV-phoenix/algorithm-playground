import '../data/algorithm_step.dart';

List<AlgorithmStep> generateLinearSearchSteps(
  List<int> array,
  int target,
) {
  List<AlgorithmStep> steps = [];

  for (int i = 0; i < array.length; i++) {
    // Checking current element
    steps.add(
      AlgorithmStep(
        array: List.from(array),
        highlightedIndices: [i],
        activeLine: 1,
        target: target,
        variables: {
          "i": "$i",
          "target": "$target",
          "arr[i]": "${array[i]}",
        },
        explanation:
            "Checking index $i. Current value is ${array[i]}.",
      ),
    );

    // Comparison line
    steps.add(
      AlgorithmStep(
        array: List.from(array),
        highlightedIndices: [i],
        activeLine: 2,
        target: target,
        variables: {
          "i": "$i",
          "target": "$target",
          "arr[i]": "${array[i]}",
        },
        explanation:
            "Comparing ${array[i]} with target $target.",
      ),
    );

    if (array[i] == target) {
      steps.add(
        AlgorithmStep(
          array: List.from(array),
          highlightedIndices: [i],
          activeLine: 3,
          target: target,
          variables: {
            "i": "$i",
          },
          explanation:
              "Target found at index $i.",
        ),
      );

      return steps;
    }
  }

  return steps;
}