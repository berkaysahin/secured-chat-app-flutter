import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/constants.dart';
import 'package:secured_chat_app/screens/welcome/welcome_screen.dart';
import 'components/bottom_navigation.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  final bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mesajlaşma Uygulaması',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: isAuthenticated ? const BottomNavigation() : WelcomeScreen(),
    );
  }
}
