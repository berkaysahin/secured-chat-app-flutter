// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/profile/components/body.dart';
import 'package:secured_chat_app/screens/profile/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key key,
  }) : super(key: key);

  ProfileController messageBoxController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
