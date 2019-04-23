import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'screens/main.dart';

class App extends HookWidget {
  final PageController tabPageController = PageController(
    initialPage: 0,
  );

  List<BottomNavigationBarItem> _bottomNavBuilder() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.call_to_action),
        title: Text('Quest'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        title: Text('Chat'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile'),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final _pageIndex = useState(0);

    return Scaffold(
      body: PageView(
        controller: tabPageController,
        onPageChanged: (i) {
          _pageIndex.value = i;
        },
        children: <Widget>[
          QuestScreen(),
          MessageScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex.value,
        items: _bottomNavBuilder(),
        onTap: (i) {
          _pageIndex.value = i;
          tabPageController.animateToPage(
            _pageIndex.value,
            duration: Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
          );
        },
      ),
    );
  }
}
