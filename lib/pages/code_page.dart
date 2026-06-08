import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/algorithm.dart';
import '../data/algorithm_source_code.dart';

class CodePage extends StatefulWidget {
  final Algorithm algorithm;

  const CodePage({super.key, required this.algorithm});

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  String selectedLanguage = "Python";

  String getCurrentCode() {
    switch (widget.algorithm.name) {
      case "Linear Search":
        return selectedLanguage == "Python"
            ? linearSearchPython
            : linearSearchC;

      case "Binary Search":
        return selectedLanguage == "Python"
            ? binarySearchPython
            : binarySearchC;

      case "Bubble Sort":
        return selectedLanguage == "Python" ? bubbleSortPython : bubbleSortC;

      case "Selection Sort":
        return selectedLanguage == "Python"
            ? selectionSortPython
            : selectionSortC;

      default:
        return "Code not available";
    }
  }

  @override
  Widget build(BuildContext context) {
    final code = getCurrentCode();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //----------------------------------
          // LANGUAGE SELECTOR
          //----------------------------------
          Row(
            children: [
              ChoiceChip(
                label: const Text("Python"),
                selected: selectedLanguage == "Python",
                onSelected: (_) {
                  setState(() {
                    selectedLanguage = "Python";
                  });
                },
              ),

              const SizedBox(width: 12),

              ChoiceChip(
                label: const Text("C"),
                selected: selectedLanguage == "C",
                onSelected: (_) {
                  setState(() {
                    selectedLanguage = "C";
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          //----------------------------------
          // CODE BLOCK
          //----------------------------------
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: SingleChildScrollView(
                child: SelectableText(
                  code,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'monospace',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          //----------------------------------
          // COPY BUTTON
          //----------------------------------
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.copy),
              label: const Text("Copy Code"),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: code));

                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Code copied to clipboard")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
