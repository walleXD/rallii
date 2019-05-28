import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "src/app.dart";
import 'src/utils/AppState.dart';

void main() => runApp(AppRoot());

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppState>(
      builder: (context) => AppState(),
      child: MaterialApp(
        title: 'Rallii',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.pinkAccent,
        ),
        home: App(),
      ),
    );
  }
}

// TODO: Implement firebase setup for android
