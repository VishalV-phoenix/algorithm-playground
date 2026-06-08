import 'package:flutter/material.dart';

class ArrayVisualization extends StatelessWidget {
  final List<int> array;
  final List<int> highlightedIndices;
  final List<int> sortedIndices;

  const ArrayVisualization({
    super.key,
    required this.array,
    required this.highlightedIndices,
    this.sortedIndices = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(array.length, (index) {
          bool highlighted = highlightedIndices.contains(index);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: sortedIndices.contains(index)
                    ? Colors.green
                    : highlighted
                    ? Colors.orange
                    : Colors.blue.shade400,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                array[index].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
