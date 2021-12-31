// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:secured_chat_app/database/db_helper.dart';
import 'package:secured_chat_app/screens/add_friends/add_friend_controller.dart';
import 'package:secured_chat_app/screens/message/message_screen.dart';
import 'package:secured_chat_app/screens/message_box/message_box_controller.dart';
import 'package:secured_chat_app/services/urls.dart';

class MessageBoxCard extends StatelessWidget {
  final String friendId;
  final String nickname;
  final String message;
  final String sendDate;
  final bool read;
  final bool isOnline = false;
  final String avatarUrl;

  MessageBoxCard({
    Key key,
    @required this.friendId,
    @required this.nickname,
    @required this.message,
    @required this.sendDate,
    @required this.read,
    @required this.avatarUrl,
  }) : super(key: key);

  MessageBoxController messageBoxController = Get.find();
  AddFriendController addFriendController = Get.find();
  final DbHelper _dbHelper = DbHelper();
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        var myFriendPublicKey = BigInt.parse((await messageBoxController.getPublicKey(friendId)).toString());

        var currentUserMailAdress = GetStorage().read('email').toString();
        var user = await _dbHelper.getUser(currentUserMailAdress);
        BigInt myPrivateKey = BigInt.parse(user.secureKey, radix: 16);

        var dhParameterResult = await addFriendController.getDHParameters(friendId.toString());
        var numberP = BigInt.parse(dhParameterResult["numberP"].toString());
        var crypto = myFriendPublicKey.modPow(myPrivateKey, numberP);
      
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              nickname: nickname,
              friendId: friendId,
              isOnline: isOnline,
              avatarUrl: avatarUrl,
              crypto : crypto.toString()
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(2),
              decoration: (message != "" && !read)
                  ? BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                      // shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    )
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: (avatarUrl == null || avatarUrl == '')
                    ? const AssetImage('assets/images/person.jpg')
                    : NetworkImage(urlAvatarImages + avatarUrl),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            nickname,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          (message != "" && !read)
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  width: 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Container(
                                  child: null,
                                ),
                        ],
                      ),
                      Text(
                        sendDate == ''
                            ? ''
                            : DateFormat("yyyy-MM-dd HH:mm:ss")
                                .format(DateTime.parse(sendDate))
                                .toString(),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
