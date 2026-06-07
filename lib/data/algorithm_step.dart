// Represents ONE moment in the algorithm execution
class AlgorithmStep {
  // Current array state
  final List<int> array;

  // Which blocks should be highlighted
  final List<int> highlightedIndices;

  // Which line of code is active
  final int activeLine;

  final int target;

  // Variable values to display
  final Map<String, String> variables;

  // Human-readable explanation
  final String explanation;

  const AlgorithmStep({
    required this.array,
    required this.highlightedIndices,
    required this.activeLine,
    required this.target,
    required this.variables,
    required this.explanation,
  });
}