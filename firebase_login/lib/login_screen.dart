import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                Image.asset("images/signup.jpg", width: 300)
                    .animate()
                    .fade()
                    .slideY(begin: -3)
                    .animate(onPlay: (controller) => controller.repeat())
                    .shake(hz: 1, curve: Curves.decelerate, duration: 1800.ms),
                SizedBox(height: 20),
                Text(
                      "WelCome back!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                    .animate()
                    .fade(delay: 500.ms)
                    .slideX(begin: -1)
                    .tint(color: Colors.blueGrey, delay: 1000.ms)
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(delay: 1000.ms, duration: 2000.ms),
                Text(
                  "Sign up to continue",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ).animate().fade(delay: 1500.ms),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ).animate().fade(delay: 2000.ms),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ).animate().fade(delay: 2000.ms),
                ),
                SizedBox(height: 24),
                Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ).animate().fade(delay: 2000.ms),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ).animate().fade(delay: 2000.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
