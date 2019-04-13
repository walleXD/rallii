import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import './widgets/bottom_navigation.dart';
import './widgets/tab_navigator.dart';

class App extends HookWidget {
  final Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.quest: GlobalKey<NavigatorState>(),
    TabItem.message: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };
  final PageController _controller = new PageController(keepPage: true);

  @override
  Widget build(BuildContext context) {
    final _currentTab = useState(TabItem.quest);

    return WillPopScope(
      onWillPop: () async =>
          !await _navigatorKeys[_currentTab].currentState.maybePop(),
      child: Scaffold(
        body: PageView(
          controller: _controller,
          children: <Widget>[
            _buildOffstageNavigator(TabItem.quest, _currentTab.value),
            _buildOffstageNavigator(TabItem.message, _currentTab.value),
            _buildOffstageNavigator(TabItem.profile, _currentTab.value),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab.value,
          onSelectTab: (TabItem tabItem) {
            _controller.animateToPage(tabItem.index,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
            _currentTab.value = tabItem;
          },
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem, TabItem currentTab) {
    return TabNavigator(
      navigatorKey: _navigatorKeys[tabItem],
      tabItem: tabItem,
    );
  }
}
