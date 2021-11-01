import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/components/text_field_container.dart';
import 'package:secured_chat_app/constants.dart';
import 'package:secured_chat_app/screens/login/loginController.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  RoundedPasswordField({
    Key key,
    this.onChanged,
    this.textEditingController,
  }) : super(key: key);
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Obx(
        () => TextField(
          controller: textEditingController,
          obscureText: loginController.isPasswordShow.value,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: "Şifre",
            icon: const Icon(
              Icons.lock,
              color: primaryColor,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                loginController.isPasswordShow.value =
                    !loginController.isPasswordShow.value;
              },
              icon: loginController.isPasswordShow.value
                  ? const Icon(
                      Icons.visibility,
                      color: primaryColor,
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: primaryColor,
                    ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
