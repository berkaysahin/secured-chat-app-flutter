// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/models/friend_request_model.dart';
import 'package:secured_chat_app/models/friends_model.dart';
import 'package:secured_chat_app/services/fetch.dart';

class AddFriendController extends GetxController {
  TextEditingController emailController = TextEditingController();
  var addFriendLoading = false.obs;
  var getFriendRequestList = RxList<FriendRequest>();
  var getFriendList = RxList<Friends>();

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

  getFriendRequests() async {
    getFriendRequestList.clear();

    var result = await f.getFriendRequests();
    if (result["success"]) {
      getFriendRequestList.value = (result["data"]["requests"] as List)
          .map((e) => FriendRequest.fromJson(e))
          .toList();
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
    }
  }

  Future<bool> acceptFriendRequests(String id) async {
    var result = await f.acceptFriendRequests(id);
    if (result["success"]) {
      return true;
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
      return false;
    }
  }

  Future<bool> rejectFriendRequests(String id) async {
    var result = await f.rejectFriendRequests(id);
    if (result["success"]) {
      return true;
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
      return false;
    }
  }

  getFriendsList() async {
    getFriendList.clear();

    var result = await f.getFriendsList();
    if (result["success"]) {
      getFriendList.value = (result["data"]["requests"] as List)
          .map((e) => Friends.fromJson(e))
          .toList();
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
    }
  }

  Future<bool> removeFriend(String id) async {
    var result = await f.removeFriend(id);
    if (result["success"]) {
      return true;
    } else {
      Get.snackbar(
        "Hata",
        result["error"],
        barBlur: 100,
      );
      return false;
    }
  }
}
