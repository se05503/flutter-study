import 'package:firebase_login/dashboard_page.dart';
import 'package:firebase_login/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                Image.asset("images/signin.png", width: 300)
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
                  "Sign in to continue",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ).animate().fade(delay: 1500.ms),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: emailController,
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
                    controller: passwordController,
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
                GestureDetector(
                  onTap: () async {
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                      if (user.user != null) {
                        emailController.clear();
                        passwordController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("로그인에 성공했습니다!"),
                            backgroundColor: Colors.blue,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardPage(),
                          ),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      String msg = switch (e.code) {
                        'invalid-email' => "이메일 형식이 올바르지 않습니다",
                        'invalid-credential' => "아이디 또는 비밀번호를 확인해주세요",
                        'network-request-failed' => "네트워크 연결을 확인해주세요",
                        _ => "오류가 발생했습니다",
                      };
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(msg),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ).animate().fade(delay: 2000.ms),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",
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
