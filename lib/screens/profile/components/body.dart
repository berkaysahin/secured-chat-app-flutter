import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/components/rounded_button.dart';
import 'package:secured_chat_app/components/rounded_input_field.dart';
import 'package:secured_chat_app/screens/profile/components/profile_pic.dart';
import 'package:secured_chat_app/screens/welcome/welcome_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    return const WelcomeScreen();
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
