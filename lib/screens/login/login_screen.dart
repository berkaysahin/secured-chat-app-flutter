import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/login/components/body.dart';

import 'loginController.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key key,
  }) : super(key: key);

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // loginController.stringvar.value;
    return Scaffold(
      body: Body(),
    );
  }
}
