import 'package:flutter/material.dart';

import '../algorithms/linear_search.dart';
import '../algorithms/binary_search.dart';

import '../data/algorithm.dart';
import '../data/algorithm_registry.dart';

import '../widgets/comparison_graph.dart';

import '../data/algorithm_comparisons.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({super.key});

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  late Algorithm algorithmA;
  late Algorithm algorithmB;

  bool showAlgorithmA = true;
  bool showAlgorithmB = true;

  List<Algorithm> get availableAlgorithms {
    return algorithms
        .where((algorithm) => algorithm.category == algorithmA.category)
        .toList();
  }

  @override
  void initState() {
    super.initState();

    algorithmA = linearSearch;
    algorithmB = binarySearch;
  }

  List<int> get commonInputSizes {
    return algorithmA.supportedInputSizes
        .where((size) => algorithmB.supportedInputSizes.contains(size))
        .toList();
  }

  int get comparisonInputSize {
    final common = commonInputSizes;

    if (common.isNotEmpty) {
      return common.last;
    }

    return [
      algorithmA.supportedInputSizes.last,
      algorithmB.supportedInputSizes.last,
    ].reduce((a, b) => a < b ? a : b);
  }

  @override
  Widget build(BuildContext context) {
    final dataA = algorithmA.generateTheoreticalCurve(comparisonInputSize);

    final dataB = algorithmB.generateTheoreticalCurve(comparisonInputSize);

    final comparisonAlgorithms = availableAlgorithms
        .where((algorithm) => algorithm != algorithmA)
        .toList();

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Algorithm Comparison",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 6),
                //------------------------------------
                // DROPDOWNS
                //------------------------------------
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<Algorithm>(
                    value: algorithmA,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: algorithms.map((algorithm) {
                      return DropdownMenuItem(
                        value: algorithm,
                        child: Text(algorithm.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        algorithmA = value!;

                        final validAlgorithms = availableAlgorithms
                            .where((algorithm) => algorithm != algorithmA)
                            .toList();

                        if (!validAlgorithms.contains(algorithmB)) {
                          algorithmB = validAlgorithms.first;
                        }
                      });
                    },
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<Algorithm>(
                    value: comparisonAlgorithms.contains(algorithmB)
                        ? algorithmB
                        : comparisonAlgorithms.first,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: comparisonAlgorithms.map((algorithm) {
                      return DropdownMenuItem(
                        value: algorithm,
                        child: Text(algorithm.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        algorithmB = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),

                //------------------------------------
                // TOGGLES
                //------------------------------------
                CheckboxListTile(
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Text(algorithmA.name),
                  value: showAlgorithmA,
                  onChanged: (value) {
                    setState(() {
                      showAlgorithmA = value!;
                    });
                  },
                ),
                const SizedBox(height: 12),

                CheckboxListTile(
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Text(algorithmB.name),
                  value: showAlgorithmB,
                  onChanged: (value) {
                    setState(() {
                      showAlgorithmB = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                //------------------------------------
                // GRAPH
                //------------------------------------
                const Text(
                  "Compare Growth Curves",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                ComparisonGraph(
                  algorithmAData: dataA,
                  algorithmBData: dataB,
                  algorithmAName: algorithmA.name,
                  algorithmBName: algorithmB.name,
                  showAlgorithmA: showAlgorithmA,
                  showAlgorithmB: showAlgorithmB,
                ),

                const SizedBox(height: 16),

                if (algorithmA.worstCase == algorithmB.worstCase)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "These algorithms have the same asymptotic growth rate, so their theoretical curves overlap.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),

                //------------------------------------
                // LEGEND
                //------------------------------------
                Row(
                  children: [
                    Container(width: 20, height: 4, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      algorithmA.name,
                      style: const TextStyle(color: Colors.white),
                    ),

                    const SizedBox(width: 24),

                    Container(width: 20, height: 4, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(
                      algorithmB.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                //------------------------------------
                // EXPLANATION
                //------------------------------------
                const Text(
                  "How They Compare",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  getComparisonExplanation(algorithmA.name, algorithmB.name),
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
