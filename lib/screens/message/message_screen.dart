// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:secured_chat_app/screens/message/components/body.dart';

class ChatScreen extends StatelessWidget {
  final String nickname;
  final String friendId;
  final bool isOnline;
  final String avatarUrl;
  final String crypto;
  ChatScreen({
    Key key,
    this.nickname,
    this.isOnline,
    this.friendId,
    this.avatarUrl,
    this.crypto
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Body(
      nickname: nickname,
      friendId: friendId,
      isOnline: isOnline,
      avatarUrl: avatarUrl,
      crypto : crypto
    );
  }
}
