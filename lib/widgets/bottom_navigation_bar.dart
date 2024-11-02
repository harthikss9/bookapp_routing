import 'package:flutter/material.dart';
import '../pages/by_author_page.dart';
import '../pages/by_title_page.dart';
import '../pages/profile_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final Widget child;

  BottomNavigationBarWidget({required this.child});

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ByAuthorPage(),
    ByTitlePage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'By Author'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'By Title'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}
