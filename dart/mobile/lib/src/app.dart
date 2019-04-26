import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'screens/main.dart';

class App extends HookWidget {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  List<BottomNavigationBarItem> _buildBottomNavTab() => [
        BottomNavigationBarItem(
          icon: Icon(Icons.inbox),
          title: Text('Logs'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          title: Text('Chats'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        )
      ];

  BottomNavigationBar _buildBottomNavBar(ValueNotifier<int> pageIndex) =>
      BottomNavigationBar(
        currentIndex: pageIndex.value,
        items: _buildBottomNavTab(),
        onTap: (i) {
          pageIndex.value = i;
          _pageController.animateToPage(
            pageIndex.value,
            duration: Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
          );
        },
      );

  List<Widget> _buildPages() => [
        Log(),
        Chat(),
        Profile(),
      ];

  @override
  Widget build(BuildContext context) {
    final pageIndex = useState(0);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: (i) {
          pageIndex.value = i;
        },
        children: _buildPages(),
      ),
      bottomNavigationBar: _buildBottomNavBar(pageIndex),
    );
  }
}
