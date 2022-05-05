// Import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble/constants/constants.dart';
import 'package:bubble/pages/pages.dart';
import 'package:bubble/utils/utils.dart';
import 'package:bubble/widgets/widgets.dart';

// Home screen class
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final titles = const [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts'
  ];

  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  void handleIndex(int index) {
    currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTransparent,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (BuildContext context, int value, _) => Text(
            titles[value],
            style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        leadingWidth: 48,
        leading: Align(
          alignment: Alignment.centerRight,
          child: GestureIcon(
            icon: Icons.search,
            callback: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Avatar.small(url: BubbleImageUtils.generateRandomImage()),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (BuildContext context, int value, _) => pages[value],
      ),
      bottomNavigationBar: _BottomNavigationBar(callback: handleIndex),
    );
  }
}

// Bottom navigation bar class
class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final ValueChanged<int> callback;

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

// Bottom navigation bar state class
class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var currentIndex = 0;

  void handleIndex(int index) {
    setState(() => currentIndex = index);
    widget.callback(currentIndex);
  }

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
            callback: handleIndex,
            isSelected: (currentIndex == 0),
          ),
          _NavigationBarItem(
            name: 'Notifications',
            icon: CupertinoIcons.bell_solid,
            index: 1,
            callback: handleIndex,
            isSelected: (currentIndex == 1),
          ),
          _NavigationBarItem(
            name: 'Calls',
            icon: CupertinoIcons.phone_fill,
            index: 2,
            callback: handleIndex,
            isSelected: (currentIndex == 2),
          ),
          _NavigationBarItem(
            name: 'Contacts',
            icon: CupertinoIcons.person_2_fill,
            index: 3,
            callback: handleIndex,
            isSelected: (currentIndex == 3),
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
    this.isSelected = false,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final int index;
  final ValueChanged<int> callback;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? colorTint : null,
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : null,
                fontSize: 12,
                color: isSelected ? colorTint : null,
              ),
            ),
          ],
        )
      ),
      onTap: () => callback(index),
      behavior: HitTestBehavior.opaque,
    );
  }
}
