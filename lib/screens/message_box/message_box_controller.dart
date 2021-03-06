// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:secured_chat_app/models/message_box_model.dart';
import 'package:secured_chat_app/services/fetch.dart';

class MessageBoxController extends GetxController {
  var messageBoxList = RxList<MessageBox>();

  Fetch f = Fetch();

  getMessageBoxList() async {
    messageBoxList.clear();

    var result = await f.getMessageBoxList();
    if (result["success"]) {
      messageBoxList.value = (result["data"]["response"] as List)
          .map((e) => MessageBox.fromJson(e))
          .toList();
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
    }
  }

  getPublicKey(String toId) async {
    var result = await f.getPublicKey(toId);
    if (result["success"]) {
      return result["data"]["publicKey"];
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
    }
  }
}
