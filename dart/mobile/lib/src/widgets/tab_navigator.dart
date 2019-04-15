import 'package:flutter/material.dart';

import 'bottom_navigation.dart';
import '../screens/settings.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String settings = '/settings';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => TabHelper.widget(tabItem),
      TabNavigatorRoutes.settings: (context) => SettingsScreen()
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) {
              return routeBuilders[routeSettings.name](context);
            },
          );
        });
  }
}
