// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/models/screen_enum.dart';
import 'package:secured_chat_app/screens/message_box/components/message_box_card.dart';
import 'package:secured_chat_app/screens/message_box/message_box_controller.dart';
import 'package:secured_chat_app/services/socket_controller.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  MessageBoxController messageBoxController = Get.find();
  SocketController socketController = Get.find();

  String id = GetStorage().read('id');

  @override
  Widget build(BuildContext context) {
    socketController.activeScreen.value = ScreenEnum.MessageBox;
    socketController.activeChatFriendId.value = "";
    messageBoxController.getMessageBoxList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => ListView.builder(
          itemCount: messageBoxController.messageBoxList.length,
          itemBuilder: (BuildContext context, int index) {
            return MessageBoxCard(
              friendId: messageBoxController.messageBoxList[index].friendId,
              message: messageBoxController.messageBoxList[index].message,
              nickname: messageBoxController.messageBoxList[index].nickname,
              read: (messageBoxController
                          .messageBoxList[index].lastSenderUserId ==
                      id
                  ? true
                  : messageBoxController.messageBoxList[index].read),
              sendDate: messageBoxController.messageBoxList[index].sendDate,
              avatarUrl: messageBoxController.messageBoxList[index].avatarUrl,
            );
          },
        ),
      ),
    );
  }
}
