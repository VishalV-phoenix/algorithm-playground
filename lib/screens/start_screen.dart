import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import 'home_screen.dart';

/// --------------------
/// START SCREEN
/// --------------------
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 43, 95),
      body: Container(
        margin: const EdgeInsets.all(10), // border space
        decoration: BoxDecoration(
          border: Border.all(color: primaryBlue, width: 5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            /// CENTER CONTENT
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset(
                        'assets/icon/app_icon.png',
                        width: 120,
                        height: 120,
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// Balloon Text
                    const Text(
                      "AlgoQuest",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 59, 193, 255),
                        shadows: [
                          Shadow(
                            blurRadius: 22,
                            color: Color.fromARGB(143, 255, 255, 255),
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// GET STARTED BUTTON
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 36, 186, 255),
                        foregroundColor: Colors.white,
                        elevation: 10, // shadow (floating effect)
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 18,
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const HomeScreen(openDrawerOnStart: true),
                          ),
                        );
                      },
                      child: const Text("Get Started"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
