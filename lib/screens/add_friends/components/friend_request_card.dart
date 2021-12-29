// ignore_for_file: must_be_immutable, list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/add_friends/add_friend_controller.dart';

class FriendRequestCard extends StatelessWidget {
  final int index;
  final String name;
  final String id;
  final String senderUserId;

  FriendRequestCard({
    Key key,
    @required this.index,
    @required this.name,
    @required this.id,
    @required this.senderUserId
  }) : super(key: key);

  AddFriendController addFriendController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  onPressed: () async {
                    final bool result =
                        await addFriendController.acceptFriendRequests(id);
                    if (result) {
                      addFriendController.getFriendRequestList.removeAt(index);
                      addFriendController.getFriendsList();
                      Get.snackbar(
                        "Başarılı!",
                        'Arkadaş isteği kabul edildi.',
                        barBlur: 100,
                      );

                      var yourKey = BigInt.parse(
                        "42111D3A7ECAA6A83E503825F38629AD9754D93370D681AEFEE152329D8DAE6C20732C5A7B6393DEDDB62753CEEFAE0A5E1BD037A5A32364CE1375442E58997C2918563EE5D7452373847AABAD5A5D02DF289B3A0B9096A375AE509F16363B4573A5CCCDFFF2B60459D52C0E5280853000CE6268560A95111723AF5916CC8376",
                        radix: 16);

                      var result = await addFriendController.getDHParameters(senderUserId);
                      var numberP = BigInt.parse(result["numberP"].toString());
                      var numberG = BigInt.parse(result["numberG"].toString());

                      var myPublicKey = numberG.modPow(yourKey, numberP);
                      result = await addFriendController.setPublicKey(myPublicKey.toString(), senderUserId);
                    }
                  },
                  icon: const Icon(Icons.check)),
              IconButton(
                  onPressed: () async {
                    final bool result =
                        await addFriendController.rejectFriendRequests(id);
                    if (result) {
                      addFriendController.getFriendRequestList.removeAt(index);
                      addFriendController.getFriendsList();
                      Get.snackbar(
                        "Başarılı",
                        "Arkadaş isteği reddedildi.",
                        barBlur: 100,
                      );
                    }
                  },
                  icon: const Icon(Icons.clear)),
            ],
          ),
        ),
      ),
    );
  }
}
