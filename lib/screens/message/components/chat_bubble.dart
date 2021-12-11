// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secured_chat_app/constants.dart';
import 'package:secured_chat_app/models/message_model.dart';
import 'package:secured_chat_app/screens/profile/profile_controller.dart';
import 'package:secured_chat_app/services/socket_controller.dart';
import 'package:secured_chat_app/services/urls.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool isMe;
  final bool isSameUser;
  final String avatarUrl;

  ChatBubble({
    Key key,
    @required this.message,
    @required this.isMe,
    @required this.isSameUser,
    @required this.avatarUrl,
  }) : super(key: key);

  ProfileController profileController = Get.find();
  SocketController socketController = Get.find();

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      message.sendDate == ''
                          ? ''
                          : DateFormat("yyyy-MM-dd HH:mm:ss")
                              .format(DateTime.parse(message.sendDate))
                              .toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Obx(
                        () => CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              (profileController.avatarUrl.value == null ||
                                      profileController.avatarUrl.value == '')
                                  ? const AssetImage('assets/images/person.jpg')
                                  : NetworkImage(urlAvatarImages +
                                      profileController.avatarUrl.value),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.message,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Obx(
                        () => CircleAvatar(
                          radius: 15,
                          backgroundImage: (socketController
                                          .activeChatFriendAvatarUrl.value ==
                                      null ||
                                  socketController
                                          .activeChatFriendAvatarUrl.value ==
                                      '')
                              ? const AssetImage('assets/images/person.jpg')
                              : NetworkImage(urlAvatarImages +
                                  socketController
                                      .activeChatFriendAvatarUrl.value),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      message.sendDate == ''
                          ? ''
                          : DateFormat("yyyy-MM-dd HH:mm:ss")
                              .format(DateTime.parse(message.sendDate))
                              .toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }
}
