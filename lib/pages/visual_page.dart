import 'package:flutter/material.dart';

import '../algorithms/binary_search_steps.dart';
import '../data/algorithm_code.dart';

import '../algorithms/linear_search_steps.dart';
import '../data/algorithm_step.dart';

import '../widgets/array_visualization.dart';
import '../widgets/code_view.dart';

import '../widgets/variables_panel.dart';
import '../data/algorithm.dart';

import '../algorithms/bubble_sort_steps.dart';

class VisualPage extends StatefulWidget {
  final Algorithm algorithm;

  const VisualPage({super.key, required this.algorithm});

  @override
  State<VisualPage> createState() => _VisualPageState();
}

class _VisualPageState extends State<VisualPage> {
  int get targetValue {
    switch (widget.algorithm.name) {
      case "Binary Search":
        return 11;

      case "Linear Search":
        return 9;

      default:
        return 0;
    }
  }

  int currentStep = 0;

  List<AlgorithmStep> getSteps() {
    switch (widget.algorithm.name) {
      case "Binary Search":
        return generateBinarySearchSteps([1, 3, 5, 7, 9, 11, 13, 15], 11);

      case "Bubble Sort":
        return generateBubbleSortSteps([5, 8, 2, 9, 1, 7]);

      case "Linear Search":
      default:
        return generateLinearSearchSteps([5, 8, 2, 9, 1, 7], 9);
    }
  }

  List<String> getCodeLines() {
    switch (widget.algorithm.name) {
      case "Binary Search":
        return binarySearchCode;

      case "Bubble Sort":
        return bubbleSortCode;

      case "Linear Search":
      default:
        return linearSearchCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = getSteps();
    final codeLines = getCodeLines();

    if (currentStep >= steps.length) {
      currentStep = 0;
    }

    final step = steps[currentStep];

    return Column(
      children: [
        const SizedBox(height: 6),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // ===================================
                  // TOP SECTION
                  // Array Visualization
                  // ===================================
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ==================================
                      // TARGET DISPLAY
                      // ==================================
                      if (widget.algorithm.category == "Searching")
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blueAccent),
                          ),
                          child: Text(
                            "Target = $targetValue",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      Center(
                        child: ArrayVisualization(
                          array: step.array,
                          highlightedIndices: step.highlightedIndices,
                          sortedIndices: step.sortedIndices,
                        ),
                      ),
                    ],
                  ),

                  // ===================================
                  // Explanation
                  // ===================================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      step.explanation,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ===================================
                  // Variables
                  // ===================================
                  VariablesPanel(variables: step.variables),

                  const SizedBox(height: 16),

                  // ===================================
                  // CODE SECTION
                  // ===================================
                  CodeView(activeLine: step.activeLine, codeLines: codeLines),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: currentStep > 0
                    ? () {
                        setState(() {
                          currentStep--;
                        });
                      }
                    : null,
                child: const Text("Prev"),
              ),

              const SizedBox(width: 20),

              Text(
                "${currentStep + 1}/${steps.length}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 20),

              ElevatedButton(
                onPressed: currentStep < steps.length - 1
                    ? () {
                        setState(() {
                          currentStep++;
                        });
                      }
                    : null,
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
