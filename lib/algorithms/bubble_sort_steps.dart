import '../data/algorithm_step.dart';

List<AlgorithmStep> generateBubbleSortSteps(
  List<int> array,
) {
  List<AlgorithmStep> steps = [];

  List<int> arr = List.from(array);

  List<int> sortedIndices = [];

  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      //--------------------------------------------------
      // COMPARISON STEP
      //--------------------------------------------------
      steps.add(
        AlgorithmStep(
          array: List.from(arr),
          highlightedIndices: [j, j + 1],
          sortedIndices: List.from(sortedIndices),
          activeLine: 3,
          target: 0,
          variables: {
            "i": "$i",
            "j": "$j",
          },
          explanation:
              "Comparing ${arr[j]} and ${arr[j + 1]}.",
        ),
      );

      //--------------------------------------------------
      // SWAP STEP
      //--------------------------------------------------
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;

        steps.add(
          AlgorithmStep(
            array: List.from(arr),
            highlightedIndices: [j, j + 1],
            sortedIndices: List.from(sortedIndices),
            activeLine: 4,
            target: 0,
            variables: {
              "i": "$i",
              "j": "$j",
            },
            explanation:
                "Swapped ${arr[j + 1]} and ${arr[j]}.",
          ),
        );
      }
    }

    //--------------------------------------------------
    // MARK SORTED
    //--------------------------------------------------
    sortedIndices.add(
      arr.length - i - 1,
    );

    steps.add(
      AlgorithmStep(
        array: List.from(arr),
        highlightedIndices: [],
        sortedIndices: List.from(sortedIndices),
        activeLine: 1,
        target: 0,
        variables: {
          "i": "$i",
        },
        explanation:
            "${arr[arr.length - i - 1]} is now in its final sorted position.",
      ),
    );
  }

  //--------------------------------------------------
  // FINAL ELEMENT
  //--------------------------------------------------
  sortedIndices.add(0);

  steps.add(
    AlgorithmStep(
      array: List.from(arr),
      highlightedIndices: [],
      sortedIndices: List.from(sortedIndices),
      activeLine: 0,
      target: 0,
      variables: {},
      explanation:
          "Array is fully sorted.",
    ),
  );

  return steps;
}