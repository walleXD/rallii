import 'package:flutter/material.dart';

/// Main Quest screen
class LogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Logs",
        ),
      ),
      body: Center(
        child: Text(
          "This is Log",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.dashboard),
      ),
    );
  }
}
