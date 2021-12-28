// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

      if (result["data"]["id"] == 'd2357b65-c477-415b-aeb3-424486405a13') {
        if (GetStorage().read('burak@gmail.com') == null) {
          var myKey = BigInt.parse(
              "5E8B02F2B2E9C96E0C359ECD14EB1B29EBDD61E70A61E42F0836A5974963E96D91F1462B699C222BC92BC068E9DCE5C78E4349D28DDCB6D0ED2C41F7CD8AF2418C8AE27B6909484DED7F0C5B4C286D9C36518FA5953974741B3A6F757B59A41A5CA0B74EFD919BB7ED8CCEC9CB3BC4B4F8D15D16DC4642E54691904B2F35B969",
              radix: 16);

          GetStorage().write("burak@gmail.com", myKey.toString());
        }
      } else {
        if (GetStorage().read('berkay@gmail.com') == null) {
          var yourKey = BigInt.parse(
              "42111D3A7ECAA6A83E503825F38629AD9754D93370D681AEFEE152329D8DAE6C20732C5A7B6393DEDDB62753CEEFAE0A5E1BD037A5A32364CE1375442E58997C2918563EE5D7452373847AABAD5A5D02DF289B3A0B9096A375AE509F16363B4573A5CCCDFFF2B60459D52C0E5280853000CE6268560A95111723AF5916CC8376",
              radix: 16);

          GetStorage().write("berkay@gmail.com", yourKey.toString());
        }
      }
    } else {
      Get.snackbar("Hata", result["error"]);
    }
    loginLoading.value = false;
  }
}
