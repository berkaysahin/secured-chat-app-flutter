// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/message_box/components/body.dart';
import 'package:secured_chat_app/screens/message_box/message_box_controller.dart';

class MessageBoxScreen extends StatelessWidget {
  MessageBoxScreen({
    Key key,
  }) : super(key: key);

  MessageBoxController messageBoxController = Get.put(MessageBoxController());

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
