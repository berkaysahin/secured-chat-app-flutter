// ignore_for_file: file_names, prefer_if_null_operators

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/database/db_helper.dart';
import 'package:secured_chat_app/models/user_model.dart';
import 'package:secured_chat_app/services/fetch.dart';
import 'package:secured_chat_app/utils/hex_generator.dart';

class LoginController extends GetxController {
  final DbHelper _dbHelper = DbHelper();
  final HexGenerator hexGenerator = HexGenerator();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginLoading = false.obs;
  var isPasswordShow = true.obs;
  Fetch f = Fetch();
  Future<bool> login() async {
    loginLoading.value = true;
    var result = await f.login(emailController.text, passwordController.text);
    if (result["success"] != null && result["success"]) {
      GetStorage().write("jwtToken", result["data"]["jwtToken"]);
      GetStorage().write("id", result["data"]["id"]);
      GetStorage().write("email", emailController.text);

      var user = await _dbHelper.getUser(emailController.text);
      if (user == null) {
        var newSecureKey = hexGenerator.getRandomString(256);
        User _user = User(email: emailController.text, secureKey: newSecureKey);
        _dbHelper.insertUser(_user);
      }

      loginLoading.value = false;
      return true;
    }

    Get.snackbar(
        "Hata",
        result["error"] == null
            ? "Beklenmedik bir hata oluştu!"
            : result["error"],
        barBlur: 100);
    loginLoading.value = false;
    return false;
  }
}
