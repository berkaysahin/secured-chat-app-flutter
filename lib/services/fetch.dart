// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/services/rest_connector.dart';
import 'package:secured_chat_app/services/urls.dart';

class Fetch {
  getJwtToken() {
    return GetStorage().read('jwtToken');
  }

  getId() {
    return GetStorage().read('id');
  }

  login(String email, String password) async {
    Map body = {
      "email": email,
      "password": password,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlLogin,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  register(String nickname, String email, String password) async {
    Map body = {
      "nickname": nickname,
      "email": email,
      "password": password,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlRegister,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  addFriend(String toEmail) async {
    Map body = {
      "id": getId(),
      "toEmail": toEmail,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlAddFriend,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  getFriendRequests() async {
    Map body = {
      "id": getId(),
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlGetAddFriendRequests,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  acceptFriendRequests(String id) async {
    Map body = {
      "id": id,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlAcceptFriendRequests,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  rejectFriendRequests(String id) async {
    Map body = {
      "id": id,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlRejectFriendRequests,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }
}
