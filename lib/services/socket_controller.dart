// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/components/bottom_navigation.dart';
import 'package:secured_chat_app/services/urls.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SocketController extends GetxController {
  HubConnection hubConnection;
  RxBool isConnected = false.obs;

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

    hubConnection.onreconnected(({connectionId}) {
      Get.snackbar("Başarılı", "Tekrar bağlantı sağlandı.");
    });

    hubConnection.on("clientJoined", _handleNewMessage);
  }

  void _handleNewMessage(List<Object> arguments) {
    Get.snackbar(
      "Kullanıcı Online",
      arguments[0].toString(),
      barBlur: 100,
    );
  }

  login() async {
    List<Object> values = [
      GetStorage().read('id'),
      GetStorage().read('jwtToken'),
    ];
    await hubConnection.invoke("ChatLogin", args: values);
  }
}
