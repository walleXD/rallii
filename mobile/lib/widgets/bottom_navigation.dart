import 'package:flutter/material.dart';

import 'package:rallii/screens/message.dart';
import 'package:rallii/screens/quest.dart';
import 'package:rallii/screens/profile.dart';

enum TabItem { quest, message, profile }

class TabHelper {
  static TabItem item({int index}) {
    switch (index) {
      case 0:
        return TabItem.quest;
      case 1:
        return TabItem.message;
      case 2:
        return TabItem.profile;
    }
    return TabItem.quest;
  }

  static String description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.quest:
        return 'Quest';
      case TabItem.message:
        return 'Message';
      case TabItem.profile:
        return 'Profile';
    }
    return '';
  }

  static IconData icon(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.quest:
        return Icons.search;
      case TabItem.message:
        return Icons.message;
      case TabItem.profile:
        return Icons.person;
    }
    return Icons.layers;
  }

  static widget(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.quest:
        return QuestScreen();
      case TabItem.message:
        return MessageScreen();
      case TabItem.profile:
        return ProfileScreen();
    }
    return QuestScreen();
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentTab.index,
      items: [
        _buildItem(tabItem: TabItem.quest),
        _buildItem(tabItem: TabItem.message),
        _buildItem(tabItem: TabItem.profile),
      ],
      onTap: (index) {
        onSelectTab(
          TabHelper.item(index: index),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) =>
      BottomNavigationBarItem(
        icon: Icon(
          TabHelper.icon(tabItem),
        ),
        title: Text(
          TabHelper.description(tabItem),
        ),
      );
}
