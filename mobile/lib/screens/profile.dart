import 'package:flutter/material.dart';

import 'package:rallii/screens/settings.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(
                  context,
                  '/settings',
                ),
          )
        ],
      ),
      body: Center(
        child: Text("This is Profile"),
      ),
    );
  }
}
