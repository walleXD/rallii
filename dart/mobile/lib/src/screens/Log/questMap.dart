import 'package:flutter/material.dart';

import '../../widgets/map.dart';

class QuestScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QuestMap(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 80.0),
              // color: Colors.white,
              height: 70.0,
              width: 300.0,
              child: TextField(
                controller: searchController,
                keyboardType: TextInputType.number,
                maxLength: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[50],
                  hintText: "Your Zipcode",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
