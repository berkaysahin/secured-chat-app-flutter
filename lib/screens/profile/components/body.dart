import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/components/rounded_button.dart';
import 'package:secured_chat_app/components/rounded_input_field.dart';
import 'package:secured_chat_app/models/screen_enum.dart';
import 'package:secured_chat_app/screens/profile/components/profile_pic.dart';
import 'package:secured_chat_app/screens/welcome/welcome_screen.dart';
import 'package:secured_chat_app/services/socket_controller.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  SocketController socketController = Get.find();

  @override
  Widget build(BuildContext context) {
    socketController.activeScreen.value = ScreenEnum.Others;
    socketController.activeChatFriendId.value = "";

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePicture(),
          const SizedBox(height: 20),
          RoundedInputField(
            enabled: false,
            hintText: "Burak Yazan",
            onChanged: (value) {},
          ),
          RoundedInputField(
            enabled: false,
            hintText: "burak.yazan@ogr.sakarya.edu.tr",
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
    );
  }
}
