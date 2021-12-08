import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/components/rounded_button.dart';
import 'package:secured_chat_app/components/rounded_input_field.dart';
import 'package:secured_chat_app/models/screen_enum.dart';
import 'package:secured_chat_app/screens/profile/components/profile_pic.dart';
import 'package:secured_chat_app/screens/profile/profile_controller.dart';
import 'package:secured_chat_app/screens/welcome/welcome_screen.dart';
import 'package:secured_chat_app/services/socket_controller.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  SocketController socketController = Get.find();
  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    socketController.activeScreen.value = ScreenEnum.Others;
    socketController.activeChatFriendId.value = "";
    profileController.getProfile();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Obx(
        () => Column(
          children: [
            ProfilePicture(),
            const SizedBox(height: 20),
            RoundedInputField(
              enabled: false,
              hintText: profileController.nickname.value,
              onChanged: (value) {},
            ),
            RoundedInputField(
              enabled: false,
              hintText: profileController.email.value,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Çıkış Yap",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      GetStorage().write('jwtToken', "");
                      GetStorage().write("id", "");
                      return WelcomeScreen();
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
