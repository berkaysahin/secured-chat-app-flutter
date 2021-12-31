// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/components/already_have_an_account_check.dart';
import 'package:secured_chat_app/components/rounded_button.dart';
import 'package:secured_chat_app/components/rounded_input_field.dart';
import 'package:secured_chat_app/components/rounded_password_field.dart';
import 'package:secured_chat_app/screens/login/login_screen.dart';
import 'package:secured_chat_app/screens/register/components/background.dart';
import 'package:secured_chat_app/screens/register/register_controller.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Kayıt Ol",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              textEditingController: registerController.nicknameController,
              hintText: "Kullanıcı Adı",
              onChanged: (value) {},
            ),
            RoundedInputField(
              textEditingController: registerController.emailController,
              hintText: "E-Mail",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              textEditingController: registerController.passwordController,
              onChanged: (value) {},
            ),
            Obx(
              () => RoundedButton(
                text: registerController.registerLoading.value
                    ? "Kayıt Yapılıyor"
                    : "Kayıt Ol",
                press: () {
                  if (registerController.nicknameController.text == "" ||
                      registerController.emailController.text == "" ||
                      registerController.passwordController.text == "") {
                    Get.snackbar("Hata",
                        "Kullanıcı adı, E-Mail ve şifre boş bırakılamaz.",
                        barBlur: 100);
                    return;
                  }

                  registerController.register();
                },
              ),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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
