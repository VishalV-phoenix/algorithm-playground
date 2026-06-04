import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../pages/graph_page.dart';
import '../pages/visual_page.dart';
import '../pages/code_page.dart';
import '../pages/compare_page.dart';

/// --------------------
/// HOME SCREEN
/// --------------------
class HomeScreen extends StatefulWidget {
  final bool openDrawerOnStart;

  const HomeScreen({super.key, this.openDrawerOnStart = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  String selectedAlgorithm = "Linear Search";

  final List<Widget> pages = const [
  GraphPage(),
  VisualPage(),
  CodePage(),
  ComparePage(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,

      /// ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 167, 233),

        title: Text(
          currentIndex == 3 ? "Compare Algorithms" : selectedAlgorithm,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(253, 255, 255, 255),
        ),
      ),

      /// ---------------- DRAWER ----------------
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        ),
        backgroundColor: const Color.fromARGB(255, 175, 226, 250),
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
            ListTile(
              title: const Text("Linear Search"),
              onTap: () {
                setState(() {
                  selectedAlgorithm = "Linear Search";
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Binary Search"),
              onTap: () {
                setState(() {
                  selectedAlgorithm = "Binary Search";
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      /// ---------------- BODY ----------------
      body: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: primaryBlue, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: IndexedStack(index: currentIndex, children: pages),
      ),

      /// ---------------- BOTTOM NAV ----------------
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12), // 👈 THIS FIXES IT
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(
              255,
              31,
              156,
              214,
            ), // ⚠️ not transparent anymore
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color.fromARGB(66, 255, 255, 255),
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
