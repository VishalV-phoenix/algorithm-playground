import '../data/algorithm_step.dart';

List<AlgorithmStep> generateBinarySearchSteps(List<int> array, int target) {
  List<AlgorithmStep> steps = [];

  int low = 0;
  int high = array.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;

    // Step: calculating mid
    steps.add(
      AlgorithmStep(
        array: List.from(array),
        highlightedIndices: [mid],
        activeLine: 1,
        target: target,
        variables: {
          "low": "$low",
          "high": "$high",
          "mid": "$mid",

          "target": "$target",
          "arr[mid]": "${array[mid]}",
        },
        explanation: "Checking middle element at index $mid.",
      ),
    );

    // Step: comparison
    steps.add(
      AlgorithmStep(
        array: List.from(array),
        highlightedIndices: [mid],
        activeLine: 2,
        target: target,
        variables: {
          "low": "$low",
          "high": "$high",
          "mid": "$mid",
          "target": "$target",
          "arr[mid]": "${array[mid]}",
        },
        explanation: "Comparing ${array[mid]} with target $target.",
      ),
    );

    if (array[mid] == target) {
      steps.add(
        AlgorithmStep(
          array: List.from(array),
          highlightedIndices: [mid],
          activeLine: 3,
          target: target,
          variables: {
            "low": "$low",
            "high": "$high",
            "mid": "$mid",
            "target": "$target",
            "arr[mid]": "${array[mid]}",
          },
          explanation: "Target found at index $mid.",
        ),
      );

      return steps;
    }

    if (array[mid] < target) {
      steps.add(
        AlgorithmStep(
          array: List.from(array),
          highlightedIndices: [mid],
          activeLine: 4,
          target: target,
          variables: {
            "low": "$low",
            "high": "$high",
            "mid": "$mid",
            "target": "$target",
          },
          explanation:
              "${array[mid]} is smaller than $target. Search right half.",
        ),
      );

      low = mid + 1;
    } else {
      steps.add(
        AlgorithmStep(
          array: List.from(array),
          highlightedIndices: [mid],
          activeLine: 5,
          target: target,
          variables: {
            "low": "$low",
            "high": "$high",
            "mid": "$mid",
            "target": "$target",
          },
          explanation:
              "${array[mid]} is larger than $target. Search left half.",
        ),
      );

      high = mid - 1;
    }
  }

  return steps;
}
