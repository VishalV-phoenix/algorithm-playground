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
      backgroundColor: darkBlue,
      body: Container(
        margin: const EdgeInsets.all(1), // border space
        decoration: BoxDecoration(
          border: Border.all(color: primaryBlue, width: 1),
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
                    /// Balloon Text
                    const Text(
                      "Algorithm Playground",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: primaryBlue,
                        shadows: [
                          Shadow(
                            blurRadius: 12,
                            color: Color.fromARGB(97, 255, 255, 255),
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// GET STARTED BUTTON
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          39,
                          139,
                          167,
                        ),
                        foregroundColor: Colors.white,
                        elevation: 10, // shadow (floating effect)
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 14,
                        ),
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
