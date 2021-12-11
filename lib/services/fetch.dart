// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/services/rest_connector.dart';
import 'package:secured_chat_app/services/urls.dart';

class Fetch {
  final Dio _dio = Dio();
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

  getFriendsList() async {
    Map body = {
      "id": getId(),
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlGetFriends,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  removeFriend(String id) async {
    Map body = {
      "id": id,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlRemoveFriend,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  getMessageBoxList() async {
    Map body = {
      "id": getId(),
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlGetMessageBox,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  getMessages(String friendId) async {
    Map body = {
      "id": getId(),
      "friendId": friendId,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlGetMessages,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  getProfile() async {
    Map body = {};
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlGetProfile,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  changeProfilePhoto(File image) async {
    var images = await MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last);

    var body = FormData.fromMap({
      'profileImage': images,
    });

    _dio.options.headers["Authorization"] = "Bearer ${getJwtToken()}";
    _dio.options.method = "POST";
    final response = await _dio.post(
      urlChangeProfileImage,
      data: body,
      options: Options(),
    );

    return response;
  }
}
