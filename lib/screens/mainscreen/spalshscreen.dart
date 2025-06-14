import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Spalshscreen extends StatefulWidget {
  const Spalshscreen({super.key});

  @override
  State<Spalshscreen> createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<Spalshscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  "assets/logos.png",
                  width: 200,
                  height: 140,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Total Ai',
                  style: TextStyle(
                    fontSize: 43.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.3,
            left: 0,
            right: 0,
            child: DefaultTextStyle(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32.0,
                fontFamily: 'Horizon',
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText("Let's go", textStyle: TextStyle(color: Colors.green)),
                  RotateAnimatedText("Let's Explore", textStyle: TextStyle(color: Colors.pink)),
                  RotateAnimatedText("Let's colloborate", textStyle: TextStyle(color: Colors.red)),
                  RotateAnimatedText("Let's Innovate", textStyle: TextStyle(color: Colors.teal)),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
