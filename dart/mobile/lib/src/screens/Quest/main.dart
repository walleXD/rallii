import 'package:flutter/material.dart';
import 'package:flutter_router/flutter_router.dart';

import 'quest.dart';

class Quest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: Router({
        '/': (context, match) => QuestScreen(),
      }).get,
    );
  }
}
