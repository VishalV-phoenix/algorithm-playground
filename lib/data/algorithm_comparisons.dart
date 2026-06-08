String getComparisonExplanation(
  String algorithmA,
  String algorithmB,
) {
  final key = "$algorithmA|$algorithmB";

  const explanations = {
    "Linear Search|Binary Search":
        "Linear Search checks elements one by one, causing the number of operations to grow directly with input size. Binary Search repeatedly halves the search space, so its growth is much slower. As input size increases, the gap between the two curves becomes increasingly noticeable.",

    "Binary Search|Linear Search":
        "Binary Search repeatedly halves the search space, so its growth remains slow even for large inputs. Linear Search checks elements sequentially, causing operations to increase much faster. The graph highlights how this difference becomes larger as input size grows.",
  };

  return explanations[key] ??
      "The graph compares how the operation count of these algorithms grows as input size increases. Algorithms with slower-growing curves generally scale better for larger datasets.";
}