// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:secured_chat_app/models/message_model.dart';
import 'package:secured_chat_app/services/fetch.dart';

class MessageController extends GetxController {
  var messageList = RxList<Message>();

  Fetch f = Fetch();

  getMessages(String friendId) async {
    messageList.clear();

    var result = await f.getMessages(friendId);
    if (result["success"]) {
      messageList.value = (result["data"]["response"] as List)
          .map((e) => Message.fromJson(e))
          .toList();
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
    }
  }
}
