import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Spalshscreen extends StatelessWidget {
  const Spalshscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image
            Image.asset("assets/logos.png", width: 200, height: 140),

            const SizedBox(height: 20),

            // Total Ai Text
            const Text(
              'Total Ai',
              style: TextStyle(fontSize: 43.0, color: Colors.white),
            ),

            const SizedBox(height: 10),

            // Animated Text Below
            DefaultTextStyle(
              style: const TextStyle(fontSize: 32.0, fontFamily: 'Horizon'),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText(
                    "Let's go",
                    textStyle: const TextStyle(color: Colors.green),
                  ),
                  RotateAnimatedText(
                    "Let's Explore",
                    textStyle: const TextStyle(color: Colors.pink),
                  ),
                  RotateAnimatedText(
                    "Let's colloborate",
                    textStyle: const TextStyle(color: Colors.red),
                  ),
                  RotateAnimatedText(
                    "Let's Innovate",
                    textStyle: const TextStyle(color: Colors.teal),
                  ),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
