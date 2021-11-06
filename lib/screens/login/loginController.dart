// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/components/bottom_navigation.dart';
import 'package:secured_chat_app/services/fetch.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginLoading = false.obs;
  var isPasswordShow = true.obs;
  Fetch f = Fetch();
  login() async {
    loginLoading.value = true;
    var result = await f.login(emailController.text, passwordController.text);
    if (result["success"]) {
      GetStorage().write("jwtToken", result["data"]["jwtToken"]);
      GetStorage().write("id", result["data"]["id"]);
      Get.to(() => const BottomNavigation());
    } else {
      Get.snackbar("Hata", result["error"]);
    }
    loginLoading.value = false;
  }
}
