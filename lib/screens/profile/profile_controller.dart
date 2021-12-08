// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:secured_chat_app/services/fetch.dart';

class ProfileController extends GetxController {
  var nickname = "".obs;
  var email = "".obs;

  Fetch f = Fetch();

  getProfile() async {
    var result = await f.getProfile();
    if (result["success"]) {
      nickname.value = result["data"]["nickname"];
      email.value = result["data"]["email"];
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
    }
  }
}
