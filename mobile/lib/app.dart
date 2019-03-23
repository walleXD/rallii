import 'package:flutter/material.dart';
import 'package:rallii/widgets/bottom_navigation.dart';
import 'package:rallii/widgets/tab_navigator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class App extends HookWidget {
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.quest: GlobalKey<NavigatorState>(),
    TabItem.message: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    final _currentTab = useState(TabItem.quest);

    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.message, _currentTab.value),
            _buildOffstageNavigator(TabItem.profile, _currentTab.value),
            _buildOffstageNavigator(TabItem.quest, _currentTab.value),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab.value,
          onSelectTab: (TabItem tabItem) => _currentTab.value = tabItem,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem, TabItem currentTab) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
