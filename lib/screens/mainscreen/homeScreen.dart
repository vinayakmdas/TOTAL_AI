import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:Colors.black,
        actions: [
        IconButton(onPressed: ()async{

            await FirebaseAuth.instance.signOut();

    // Optionally navigate to login screen
            Navigator.pushReplacementNamed(context, '/login');
        }, icon: Icon(Icons.exit_to_app,color:  Colors.white,))
      ],),
    );
  }
}