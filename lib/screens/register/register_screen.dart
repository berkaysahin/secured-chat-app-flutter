// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/register/components/body.dart';
import 'package:secured_chat_app/screens/register/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({
    Key key,
  }) : super(key: key);

  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
