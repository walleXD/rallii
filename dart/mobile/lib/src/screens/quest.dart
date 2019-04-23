import 'package:flutter/material.dart';

/// Main Quest screen
class QuestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quest",
        ),
      ),
      body: Center(
        child: Text(
          "This is Quest",
        ),
      ),
    );
  }
}
