// Import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble/pages/pages.dart';

// Home screen class
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final ValueNotifier<int> index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: index,
        builder: (BuildContext context, int value, _) => pages[value],
      ),
      bottomNavigationBar: _BottomNavigationBar(callback: (i) => index.value = i),
    );
  }
}

// Bottom navigation bar class
class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final ValueChanged<int> callback;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavigationBarItem(
            name: 'Messages',
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            index: 0,
            callback: callback,
          ),
          _NavigationBarItem(
            name: 'Notifications',
            icon: CupertinoIcons.bell_solid,
            index: 1,
            callback: callback,
          ),
          _NavigationBarItem(
            name: 'Calls',
            icon: CupertinoIcons.phone_fill,
            index: 2,
            callback: callback,
          ),
          _NavigationBarItem(
            name: 'Contacts',
            icon: CupertinoIcons.person_2_fill,
            index: 3,
            callback: callback,
          ),
        ],
      ),
    );
  }
}

// Navigation bar item class
class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.index,
    required this.callback,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final int index;
  final ValueChanged<int> callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontSize: 11)),
          ],
        )
      ),
      onTap: () => callback(index),
      behavior: HitTestBehavior.opaque,
    );
  }
}
