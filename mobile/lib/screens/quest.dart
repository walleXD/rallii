import 'package:flutter/material.dart';

import '../widgets/map.dart';

class QuestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quest",
        ),
      ),
      body: MapSample(),
    );
  }
}
