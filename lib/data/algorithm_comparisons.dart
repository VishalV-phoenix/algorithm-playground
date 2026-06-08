String getComparisonExplanation(
  String algorithmA,
  String algorithmB,
) {
  final key = "$algorithmA|$algorithmB";

  const explanations = {
    //--------------------------------------------------
    // SEARCHING
    //--------------------------------------------------
    "Linear Search|Binary Search":
        "Linear Search checks elements one by one, causing operations to grow directly with input size. Binary Search repeatedly halves the search space, resulting in much slower growth. As input size increases, Binary Search scales significantly better.",

    "Binary Search|Linear Search":
        "Binary Search repeatedly halves the search space, resulting in logarithmic growth. Linear Search examines elements sequentially, causing operations to increase much faster as input size grows.",

    //--------------------------------------------------
    // SORTING
    //--------------------------------------------------
    "Bubble Sort|Selection Sort":
        "Bubble Sort and Selection Sort have the same O(n²) average and worst-case time complexity, so their growth curves overlap. The difference lies in strategy: Bubble Sort repeatedly swaps adjacent elements, while Selection Sort repeatedly finds the smallest remaining element and places it in its final position. Selection Sort typically performs fewer swaps.",

    "Selection Sort|Bubble Sort":
        "Selection Sort and Bubble Sort have identical O(n²) growth, which is why their curves overlap. Selection Sort minimizes swaps by selecting the smallest remaining element each pass, while Bubble Sort repeatedly swaps neighboring elements.",
  };

  return explanations[key] ??
      "These algorithms exhibit similar growth patterns. Compare their strategies, complexity values, and behavior in the visualization page to understand their differences.";
}