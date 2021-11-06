// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/add_friends/add_friend_controller.dart';
import 'package:secured_chat_app/screens/add_friends/components/body.dart';

class AddFriendScreen extends StatelessWidget {
  AddFriendScreen({
    Key key,
  }) : super(key: key);

  AddFriendController addFriendController = Get.put(AddFriendController());

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
