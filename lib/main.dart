import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:totelai/firebase_options.dart';
import 'package:totelai/screens/mainscreen/homeScreen.dart';
import 'package:totelai/screens/authentication/loginscreen.dart';
import 'package:totelai/screens/authentication/signUp_screen.dart';
import 'package:totelai/screens/mainscreen/spalshscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 👈 REQUIRED before using Firebase

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginSCreen(),
        '/home': (context)=>const Homescreen(),
        '/signup': (context)=>const SignupScreen(),
      },
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Spalshscreen()
    );
  }
}
