import '../data/algorithm_step.dart';

List<AlgorithmStep> generateSelectionSortSteps(
  List<int> array,
) {
  List<AlgorithmStep> steps = [];

  List<int> arr = List.from(array);

  List<int> sortedIndices = [];

  for (int i = 0; i < arr.length - 1; i++) {
    int minIndex = i;

    //--------------------------------------------------
    // CURRENT MINIMUM
    //--------------------------------------------------
    steps.add(
      AlgorithmStep(
        array: List.from(arr),
        highlightedIndices: [],
        specialIndices: [minIndex],
        sortedIndices: List.from(sortedIndices),
        activeLine: 2,
        target: 0,
        variables: {
          "i": "$i",
          "minIndex": "$minIndex",
        },
        explanation:
            "Assume ${arr[minIndex]} is the minimum value.",
      ),
    );

    //--------------------------------------------------
    // SEARCH FOR SMALLER ELEMENT
    //--------------------------------------------------
    for (int j = i + 1; j < arr.length; j++) {
      steps.add(
        AlgorithmStep(
          array: List.from(arr),
          highlightedIndices: [j],
          specialIndices: [minIndex],
          sortedIndices: List.from(sortedIndices),
          activeLine: 3,
          target: 0,
          variables: {
            "i": "$i",
            "j": "$j",
            "minIndex": "$minIndex",
          },
          explanation:
              "Comparing ${arr[j]} with current minimum ${arr[minIndex]}.",
        ),
      );

      if (arr[j] < arr[minIndex]) {
        minIndex = j;

        steps.add(
          AlgorithmStep(
            array: List.from(arr),
            highlightedIndices: [],
            specialIndices: [minIndex],
            sortedIndices: List.from(sortedIndices),
            activeLine: 5,
            target: 0,
            variables: {
              "i": "$i",
              "j": "$j",
              "minIndex": "$minIndex",
            },
            explanation:
                "${arr[minIndex]} becomes the new minimum.",
          ),
        );
      }
    }

    //--------------------------------------------------
    // SWAP
    //--------------------------------------------------
    int temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;

    steps.add(
      AlgorithmStep(
        array: List.from(arr),
        highlightedIndices: [i, minIndex],
        specialIndices: [],
        sortedIndices: List.from(sortedIndices),
        activeLine: 6,
        target: 0,
        variables: {
          "i": "$i",
          "minIndex": "$minIndex",
        },
        explanation:
            "Place the minimum value in its correct position.",
      ),
    );

    //--------------------------------------------------
    // MARK SORTED
    //--------------------------------------------------
    sortedIndices.add(i);

    steps.add(
      AlgorithmStep(
        array: List.from(arr),
        highlightedIndices: [],
        specialIndices: [],
        sortedIndices: List.from(sortedIndices),
        activeLine: 1,
        target: 0,
        variables: {
          "i": "$i",
        },
        explanation:
            "${arr[i]} is now in its final sorted position.",
      ),
    );
  }

  //--------------------------------------------------
  // FINAL ELEMENT
  //--------------------------------------------------
  sortedIndices.add(arr.length - 1);

  steps.add(
    AlgorithmStep(
      array: List.from(arr),
      highlightedIndices: [],
      specialIndices: [],
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