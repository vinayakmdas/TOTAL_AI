import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:totelai/widgets/textform_read.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernamecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController conformpasswordcontroller = TextEditingController();

    final _auth = FirebaseAuth.instance;
    final _firestore = FirebaseFirestore.instance;

    signup() async {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
              email: emailcontroller.text.trim(),
              password: passwordcontroller.text.trim(),
            );

        await _firestore.collection("users").doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'username': usernamecontroller.text.trim(),
          'email': emailcontroller.text.trim(),
          'password': passwordcontroller.text.trim(),
          'createdAt': Timestamp.now(),
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Signup Successful!')));

        Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        print("Sign Up Error: $e");
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 23, right: 23),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),
                CustomTextFormField(
                  hintText: "Enter Your Name",
                  labelText: "Your Name",
                  icon: Icons.email,
                  controller: usernamecontroller,
                  line: Colors.white,
                  focusColor: Colors.white,
                  borderside: Colors.white,
                  textcolos: Colors.white,
                  cursocolor: Colors.white,
                  filedcolor: Colors.black54,
                ),
                SizedBox(height: 20),

                CustomTextFormField(
                  hintText: "Enter your Email",
                  labelText: "Email",
                  icon: Icons.email,
                  controller: emailcontroller,
                  line: Colors.white,
                  focusColor: Colors.white,
                  borderside: Colors.white,
                  textcolos: Colors.white,
                  cursocolor: Colors.white,
                  filedcolor: Colors.black54,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  hintText: "Enter your password",
                  labelText: "Password",
                  icon: Icons.lock,
                  controller: passwordcontroller,
                  line: Colors.white,
                  focusColor: Colors.white,
                  borderside: Colors.white,
                  textcolos: Colors.white,
                  cursocolor: Colors.white,
                  filedcolor: Colors.black54,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  hintText: "Conform you password",
                  labelText: "conform password",
                  icon: Icons.remove_red_eye_outlined,
                  controller: conformpasswordcontroller,
                  line: Colors.white,
                  focusColor: Colors.white,
                  borderside: Colors.white,
                  textcolos: Colors.white,
                  cursocolor: Colors.white,
                  filedcolor: Colors.black54,
                ),
                SizedBox(height: 27),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        signup();
                        
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                // Add your sign-up form here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
