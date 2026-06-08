import 'package:flutter/material.dart';
import '../data/algorithm_registry.dart';
import '../core/constants/colors.dart';

import '../pages/graph_page.dart';
import '../pages/visual_page.dart';
import '../pages/code_page.dart';
import '../pages/compare_page.dart';

import '../data/algorithm.dart';

class HomeScreen extends StatefulWidget {
  final bool openDrawerOnStart;

  const HomeScreen({super.key, this.openDrawerOnStart = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  late Algorithm selectedAlgorithm;

  Map<String, List<Algorithm>> get algorithmsByCategory {
    final Map<String, List<Algorithm>> grouped = {};

    for (final algorithm in algorithms) {
      grouped.putIfAbsent(algorithm.category, () => []);

      grouped[algorithm.category]!.add(algorithm);
    }

    return grouped;
  }

  String get pageTitle {
    switch (currentIndex) {
      case 0:
        return selectedAlgorithm.name;

      case 1:
        return selectedAlgorithm.name;

      case 2:
        return selectedAlgorithm.name;

      case 3:
        return "Algorithm Comparison";

      default:
        return selectedAlgorithm.name;
    }
  }

  void selectAlgorithm(Algorithm algorithm) {
    setState(() {
      selectedAlgorithm = algorithm;
    });

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    selectedAlgorithm = algorithms.first;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,

      //--------------------------------------------------
      // APP BAR
      //--------------------------------------------------
      appBar: AppBar(
        backgroundColor: primaryBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(pageTitle, style: const TextStyle(color: Colors.white)),
      ),

      //--------------------------------------------------
      // DRAWER
      //--------------------------------------------------
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        ),
        backgroundColor: Color.fromARGB(255, 175, 226, 250),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.blue, width: 4),
                ),
              ),
              child: const Text(
                "Select Algorithm",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 53, 91, 214),
                ),
              ),
            ),

            ...algorithmsByCategory.entries.map((entry) {
              return ExpansionTile(
                initiallyExpanded: true,

                title: Text(
                  entry.key,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                children: entry.value.map((algorithm) {
                  return ListTile(
                    leading: Icon(
                      entry.key == "Searching" ? Icons.search : Icons.sort,
                    ),

                    title: Text(algorithm.name),

                    onTap: () {
                      selectAlgorithm(algorithm);
                    },
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),

      //--------------------------------------------------
      // BODY
      //--------------------------------------------------
      body: Container(
        margin: const EdgeInsets.all(6),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(color: primaryBlue, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: IndexedStack(
          index: currentIndex,
          children: [
            GraphPage(
              key: ValueKey("graph_${selectedAlgorithm.name}"),
              algorithm: selectedAlgorithm,
            ),

            VisualPage(
              key: ValueKey("visual_${selectedAlgorithm.name}"),
              algorithm: selectedAlgorithm,
            ),

            CodePage(algorithm: selectedAlgorithm),

            const ComparePage(),
          ],
        ),
      ),

      //--------------------------------------------------
      // BOTTOM NAVIGATION
      //--------------------------------------------------
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 62, 169, 219),
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color.fromARGB(103, 255, 255, 255),
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.show_chart),
                label: "Graph",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome),
                label: "Visual",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.code), label: "Code"),
              BottomNavigationBarItem(
                icon: Icon(Icons.balance),
                label: "Compare",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
