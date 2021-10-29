import 'package:flutter/material.dart';
import 'package:secured_chat_app/constants.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  const BottomNavigation({
    Key key,
    @required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.group_add),
          label: 'Yeni Grup',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Sohbetler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      // onTap: (selectedIndex),
    );
  }
}
