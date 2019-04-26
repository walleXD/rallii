import 'package:flutter/material.dart';

import "src/app.dart";

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget {
  AppRoot({key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      key: key,
      title: 'Rallii',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pinkAccent,
      ),
      home: App(),
    );
  }
}

// TODO: Implement firebase setup for android
