// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/screens/add_friends/add_friend_controller.dart';

class FriendCard extends StatelessWidget {
  final int index;
  final String id;
  final String email;

  FriendCard({
    Key key,
    @required this.index,
    @required this.id,
    @required this.email,
  }) : super(key: key);

  AddFriendController addFriendController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(email),
        trailing: SizedBox(
          width: 50,
          child: Row(
            children: [
              IconButton(
                  onPressed: () async {
                    final bool result =
                        await addFriendController.removeFriend(id);
                    if (result) {
                      addFriendController.getFriendList.removeAt(index);
                      Get.snackbar(
                        "Başarılı",
                        "Arkadaş silindi.",
                        barBlur: 100,
                      );
                    }
                  },
                  icon: const Icon(Icons.remove)),
            ],
          ),
        ),
      ),
    );
  }
}
