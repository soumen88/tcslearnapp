import 'package:flutter/material.dart';

class LifeCycleNextScreen extends StatelessWidget {
  const LifeCycleNextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next screen Lifecycle"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Text(
            "Inside next screen of lifecycle",
            style: TextStyle(
              fontSize: 30
            ),
        ),
      ),
    );
  }
}
