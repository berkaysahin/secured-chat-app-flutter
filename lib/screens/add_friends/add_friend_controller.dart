// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/services/fetch.dart';

class AddFriendController extends GetxController {
  TextEditingController emailController = TextEditingController();
  var addFriendLoading = false.obs;

  Fetch f = Fetch();

  addFriend() async {
    addFriendLoading.value = true;
    var result = await f.addFriend(emailController.text);
    if (result["success"]) {
      Get.snackbar(
        "Başarılı!",
        'Arkadaş isteği gönderildi.',
        barBlur: 100,
      );
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
    }
    addFriendLoading.value = false;
  }
}
