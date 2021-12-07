// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secured_chat_app/components/already_have_an_account_check.dart';
import 'package:secured_chat_app/components/rounded_button.dart';
import 'package:secured_chat_app/components/rounded_input_field.dart';
import 'package:secured_chat_app/components/rounded_password_field.dart';
import 'package:secured_chat_app/models/screen_enum.dart';
import 'package:secured_chat_app/screens/login/components/background.dart';
import 'package:secured_chat_app/screens/login/loginController.dart';
import 'package:secured_chat_app/screens/register/register_screen.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/services/socket_controller.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);
  LoginController loginController = Get.find();
  SocketController socketController = Get.find();

  @override
  Widget build(BuildContext context) {
    socketController.activeScreen.value = ScreenEnum.Others;
    socketController.activeChatFriendId.value = "";

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Giriş Yap",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              textEditingController: loginController.emailController,
              hintText: "E-Mail",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              textEditingController: loginController.passwordController,
              onChanged: (value) {},
            ),
            Obx(
              () => RoundedButton(
                text: loginController.loginLoading.value
                    ? "Giriş Yapılıyor"
                    : "Giriş Yap",
                press: () async {
                  await loginController.login();
                  socketController.initSignalR();
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
