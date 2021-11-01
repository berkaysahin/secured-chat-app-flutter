import 'package:flutter/material.dart';
import 'package:secured_chat_app/constants.dart';
import 'package:secured_chat_app/screens/add_friends/add_friend_screen.dart';
import 'package:secured_chat_app/screens/message_box/message_box_screen.dart';
import 'package:secured_chat_app/screens/profile/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    AddFriendScreen(),
    MessageBoxScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Arkadaşlar',
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
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
