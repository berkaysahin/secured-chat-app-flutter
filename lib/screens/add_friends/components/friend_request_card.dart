// ignore_for_file: must_be_immutable, list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/database/db_helper.dart';
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
  final DbHelper _dbHelper = DbHelper();

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
                      var currentUserMailAdress = GetStorage().read('email').toString();
                      var user = await _dbHelper.getUser(currentUserMailAdress);
                      BigInt myPrivateKey = BigInt.parse(user.secureKey, radix: 16);

                      var result = await addFriendController.getDHParameters(senderUserId);
                      var numberP = BigInt.parse(result["numberP"].toString());
                      var numberG = BigInt.parse(result["numberG"].toString());

                      var myPublicKey = numberG.modPow(myPrivateKey, numberP);
                      result = await addFriendController.setPublicKey(myPublicKey.toString(), senderUserId);
                      
                      Get.snackbar(
                        "Başarılı!",
                        'Arkadaş isteği kabul edildi.',
                        barBlur: 100,
                      );
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
