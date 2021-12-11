// ignore_for_file: file_names

import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secured_chat_app/services/fetch.dart';
import 'package:secured_chat_app/services/socket_controller.dart';

class ProfileController extends GetxController {
  var nickname = "".obs;
  var email = "".obs;
  var avatarUrl = "".obs;

  Fetch f = Fetch();
  SocketController socketController = Get.find();

  getProfile() async {
    var result = await f.getProfile();
    if (result["success"]) {
      nickname.value = result["data"]["nickname"];
      email.value = result["data"]["email"];
      avatarUrl.value = result["data"]["avatarUrl"];
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
    }
  }

  getImage() async {
    XFile image = await ImagePicker().pickImage(source: ImageSource.gallery);
    var result = await f.changeProfilePhoto(File(image.path));
    if (result.data["success"]) {
      socketController.profileImageChanged();
      avatarUrl.value = result.data["data"];
    }
    return result.data["success"];
  }
}
