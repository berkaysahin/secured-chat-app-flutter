// ignore_for_file: file_names

import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/components/bottom_navigation.dart';
import 'package:secured_chat_app/models/message_model.dart';
import 'package:secured_chat_app/models/screen_enum.dart';
import 'package:secured_chat_app/screens/message/message_controller.dart';
import 'package:secured_chat_app/screens/message_box/message_box_controller.dart';
import 'package:secured_chat_app/services/urls.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SocketController extends GetxController {
  HubConnection hubConnection;
  RxBool isConnected = false.obs;
  Rx<ScreenEnum> activeScreen = Rx<ScreenEnum>(ScreenEnum.Others);
  RxString activeChatFriendId = "".obs;
  RxString activeChatFriendAvatarUrl = "".obs;

  MessageController messageController = Get.put(MessageController());
  MessageBoxController messageBoxController = Get.put(MessageBoxController());

  String id = GetStorage().read('id');
  String jwtToken = GetStorage().read('jwtToken');

  void initSignalR() async {
    hubConnection = HubConnectionBuilder()
        .withUrl(
          urlSocketMainHub,
        )
        .withAutomaticReconnect()
        .build();

    if (hubConnection.state == HubConnectionState.Disconnected) {
      await hubConnection.start().then(
        (value) async {
          await login();

          hubConnection.on("Connection", _handleNewLogin);
          Get.to(() => const BottomNavigation());
        },
      );

      isConnected.value = true;
    } else {
      await hubConnection.stop();
      isConnected.value = false;
    }

    hubConnection.onclose(({error}) {
      Get.snackbar("Hata", "Bağlantı koptu.");
    });

    hubConnection.onreconnecting(({error}) {
      Get.snackbar("Uyarı", "Bağlantı tekrar deneniyor..");
    });

    hubConnection.onreconnected(({connectionId}) async {
      await login();
      Get.snackbar("Başarılı", "Tekrar bağlantı sağlandı.");
    });

    hubConnection.on("receiveMessage", _handleNewMessage);
    hubConnection.on("onlineList", _handleOnlineList);
    hubConnection.on("friendProfileImageChanged", _friendProfileImageChanged);
  }

  void _handleNewLogin(List<Object> arguments) {
    // Get.snackbar(
    //   "Kullanıcı Online",
    //   arguments[0].toString(),
    //   barBlur: 100,
    // );
  }

  void _handleNewMessage(List<Object> arguments) {
    // arguments[0] senderId
    // arguments[1] message
    // arguments[2] sendDate

    Message message = Message(
      sender: arguments[0].toString(),
      to: id,
      message: arguments[1].toString(),
      read: false,
      sendDate: arguments[2].toString(),
    );

    if (activeScreen.value == ScreenEnum.Message &&
        activeChatFriendId.value == arguments[0]) {
      switchToReadMessages(activeChatFriendId.toString());
    }

    messageController.receiveMessage(message);
    messageBoxController.getMessageBoxList();
  }

  void _handleOnlineList(List<Object> arguments) {
    messageController.onlineList.clear();

    var decoded = jsonDecode(arguments[0]);
    decoded.forEach((item) {
      messageController.onlineList.add(item);
    });
  }

  void _friendProfileImageChanged(List<Object> arguments) {
    messageBoxController.getMessageBoxList();

    if (activeChatFriendId.value == arguments[0].toString()) {
      activeChatFriendAvatarUrl.value = arguments[1].toString();
    }
  }

  login() async {
    List<Object> values = [
      id,
      jwtToken,
    ];

    hubConnection.invoke("Connection", args: values);
  }

  sendMessage(String friendId, String message) async {
    List<Object> values = [
      id,
      friendId,
      message,
      DateTime.now().toString(),
      jwtToken,
    ];
    await hubConnection.invoke("SendMessage", args: values);
    messageBoxController.getMessageBoxList();
  }

  switchToReadMessages(String friendId) async {
    List<Object> values = [
      id,
      friendId,
      jwtToken,
    ];
    await hubConnection.invoke("SwitchToReadMessages", args: values);
  }

  profileImageChanged() async {
    List<Object> values = [
      id,
      jwtToken,
    ];
    await hubConnection.invoke("ProfileImageChanged", args: values);
  }

  logout() async {
    await hubConnection.invoke("Logout");
  }
}
