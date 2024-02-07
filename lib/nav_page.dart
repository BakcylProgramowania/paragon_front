import 'package:flutter/material.dart';
import './pages/history.dart';
import './pages/main_page.dart';
import './pages/friends_list.dart';
import './theme/theme.dart';
import '/default/default_widgets.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: currentPageIndex, children: [
            FriendsList(),
            MainPage(),
           HistoryPage()
          ]),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DefaultNavigationBar(
              currentPageIndex: currentPageIndex,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
