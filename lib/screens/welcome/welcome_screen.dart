import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/models/screen_enum.dart';
import 'package:secured_chat_app/screens/welcome/components/body.dart';
import 'package:secured_chat_app/services/socket_controller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key key}) : super(key: key);

  final SocketController socketController = Get.put(SocketController());

  @override
  Widget build(BuildContext context) {
    socketController.activeScreen.value = ScreenEnum.MessageBox;
    socketController.activeChatFriendId.value = "";

    return const Scaffold(
      body: Body(),
    );
  }
}
