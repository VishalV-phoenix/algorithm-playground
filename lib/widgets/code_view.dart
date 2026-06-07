import 'package:flutter/material.dart';

class CodeView extends StatelessWidget {
  final int activeLine;
  final List<String> codeLines;

  const CodeView({
    super.key,
    required this.activeLine,
    required this.codeLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(codeLines.length, (index) {
          return Container(
            width: double.infinity,
            color: activeLine == index ? Colors.green : Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              codeLines[index],
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          );
        }),
      ),
    );
  }
}
