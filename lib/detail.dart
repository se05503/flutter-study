import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail page"), backgroundColor: Colors.blue),
      body: Center(
        child: Text("Detail page content", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
