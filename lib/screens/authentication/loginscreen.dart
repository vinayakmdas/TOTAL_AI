import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:totelai/widgets/textform_read.dart';

class LoginSCreen extends StatelessWidget {
  const LoginSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    Future<void> signInWithEmail(BuildContext context) async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim(),
        );
        Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        print("Login Error: $e");
      }
    }

    Future<void> signInwithGoogle(BuildContext context) async {
      try {
        final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn()
            .signIn();
        if (googleSignInAccount == null) {
          return;
        }
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);

        Navigator.pushReplacementNamed(context, '/home');
        {}
      } catch (e) {
        print("google sign error is  $e");
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logos.png", width: 200, height: 140),
                ],
              ),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'TOTAL AI',
                        textStyle: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        colors: [
                          Colors.white,
                          Colors.yellow,
                          Colors.orange,
                          Colors.pink,
                          Colors.purpleAccent,
                          Colors.blueAccent,
                          Colors.greenAccent,
                          Colors.redAccent,
                          Colors.purple,
                          Colors.teal,
                          Colors.red,
                          Colors.blue,
                          Colors.green,
                        ],
                        speed: Duration(milliseconds: 150),
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ],
              ),
              SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 23),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24),

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
                    SizedBox(height: 23),
                    CustomTextFormField(
                      hintText: "Enter your Password",
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
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        signInWithEmail(context);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Divider(),
              ),

              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("OR", style: TextStyle(color: Colors.white))],
              ),
              SizedBox(height: 34),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      signInwithGoogle(context);
                    },
                    child: Image.asset(
                      "assets/1974895dcb39192c99c0156e80494d3e-removebg-preview.png",
                      width: 63,
                      height: 56,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      " Create an account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
