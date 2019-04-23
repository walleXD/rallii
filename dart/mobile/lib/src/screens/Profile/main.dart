import 'package:flutter/material.dart';
import 'package:flutter_router/flutter_router.dart';

import 'profile.dart';
import 'settings.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: Router({
        '/settings': (context, match) => SettingsScreen(),
        '/': (context, match) => ProfileScreen(),
      }).get,
    );
  }
}
