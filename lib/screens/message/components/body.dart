// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/components/rounded_input_field.dart';
import 'package:secured_chat_app/models/message_model.dart';
import 'package:secured_chat_app/screens/message/components/chat_bubble.dart';
import 'package:secured_chat_app/screens/message/message_controller.dart';
import 'package:secured_chat_app/services/socket_controller.dart';

class Body extends StatelessWidget {
  final String nickname;
  final String friendId;
  final bool isOnline;

  Body({
    Key key,
    this.nickname,
    this.isOnline,
    this.friendId,
  }) : super(key: key);

  MessageController messageController = Get.find();
  SocketController socketController = Get.find();

  @override
  Widget build(BuildContext context) {
    messageController.getMessages(friendId);
    String prevUserId;

    _sendMessageArea() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 70,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: RoundedInputField(
                textEditingController: messageController.messageTextController,
                hintText: "Mesaj..",
                onChanged: (value) async {},
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              iconSize: 25,
              color: Theme.of(context).primaryColor,
              onPressed: () async {
                await socketController.sendMessage(
                    friendId, messageController.messageTextController.text);

                Message message = Message(
                  sender: GetStorage().read('id').toString(),
                  to: friendId,
                  message: messageController.messageTextController.text,
                  read: true,
                  sendDate: DateTime.now().toString(),
                );

                messageController.receiveMessage(message);

                messageController.messageTextController.clear();
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: nickname,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              const TextSpan(text: '\n'),
              isOnline
                  ? const TextSpan(
                      text: 'Çevrimiçi',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : const TextSpan(
                      text: 'Çevrimdışı',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    )
            ],
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Obx(
            () => ListView.builder(
              reverse: false,
              padding: const EdgeInsets.all(20),
              itemCount: messageController.messageList.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messageController.messageList[index];
                final bool isMe = message.sender == GetStorage().read('id');
                final bool isSameUser = prevUserId == message.sender;
                prevUserId = message.sender;
                return ChatBubble(
                    message: message, isMe: isMe, isSameUser: isSameUser);
              },
            ),
          )),
          _sendMessageArea(),
        ],
      ),
    );
  }
}
