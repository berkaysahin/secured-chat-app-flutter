// ignore_for_file: must_be_immutable, list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/add_friends/add_friend_controller.dart';

class FriendRequestCard extends StatelessWidget {
  final int index;
  final String name;
  final String id;

  FriendRequestCard({
    Key key,
    @required this.index,
    @required this.name,
    @required this.id,
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
