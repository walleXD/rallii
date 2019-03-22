import 'package:flutter/material.dart';

import 'package:rallii/widgets/map.dart';

class QuestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MapSample(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 80.0),
              color: Colors.white,
              height: 70.0,
              width: 300.0,
            ),
          )
        ],
      ),
    );
  }
}
