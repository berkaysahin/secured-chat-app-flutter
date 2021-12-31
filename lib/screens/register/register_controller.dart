// ignore_for_file: file_names, prefer_if_null_operators

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/login/login_screen.dart';
import 'package:secured_chat_app/services/fetch.dart';

class RegisterController extends GetxController {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var registerLoading = false.obs;
  var isPasswordShow = true.obs;
  Fetch f = Fetch();
  register() async {
    registerLoading.value = true;
    var result = await f.register(
        nicknameController.text, emailController.text, passwordController.text);
    if (result["success"] != null && result["success"]) {
      Get.snackbar("Başarılı", "Giriş yapınız.");
      sleep(const Duration(seconds: 2));
      registerLoading.value = false;
      Get.to(() => LoginScreen());
    } else {
      Get.snackbar(
          "Hata",
          result["error"] == null
              ? "Beklenmedik bir hata oluştu!"
              : result["error"],
          barBlur: 100);
      registerLoading.value = false;
    }
  }
}
