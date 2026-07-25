import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("대시보드 화면"),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("로그아웃 되었습니다")));
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app, color: Colors.black),
          ),
        ],
      ),
      body: Center(child: Text("대시보드 화면입니다.", style: TextStyle(fontSize: 26))),
    );
  }
}
