import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'screens/main.dart';

class App extends HookWidget {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  List<BottomNavigationBarItem> _buildBottomNavTab() {
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

  BottomNavigationBar _buildBottomNavBar(ValueNotifier pageIndex) {
    return BottomNavigationBar(
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
  }

  List<Widget> _buildPages() {
    return [
      Quest(),
      Chat(),
      Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = useState(0);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (i) {
          pageIndex.value = i;
        },
        children: _buildPages(),
      ),
      bottomNavigationBar: _buildBottomNavBar(pageIndex),
    );
  }
}
