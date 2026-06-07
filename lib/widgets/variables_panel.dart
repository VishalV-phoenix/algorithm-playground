import 'package:flutter/material.dart';

class VariablesPanel extends StatelessWidget {
  final Map<String, String> variables;

  const VariablesPanel({super.key, required this.variables});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Variables",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 8),

          ...variables.entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "${entry.key} = ${entry.value}",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "monospace",
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
