// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/message/components/body.dart';
import 'package:secured_chat_app/screens/message/message_controller.dart';

class ChatScreen extends StatelessWidget {
  final String nickname;
  final String friendId;
  final bool isOnline;
  ChatScreen({
    Key key,
    this.nickname,
    this.isOnline,
    this.friendId,
  }) : super(key: key);

  MessageController messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Body(
      nickname: nickname,
      friendId: friendId,
      isOnline: isOnline,
    );
  }
}
