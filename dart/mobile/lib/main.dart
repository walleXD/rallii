import 'package:flutter/material.dart';

import "src/app.dart";

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Rallii',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: App(),
    );
  }
}

// TODO: Implement firebase setup for android
