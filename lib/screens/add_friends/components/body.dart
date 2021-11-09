// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secured_chat_app/components/rounded_button.dart';
import 'package:secured_chat_app/components/rounded_input_field.dart';
import 'package:secured_chat_app/models/friends_model.dart';
import 'package:secured_chat_app/screens/add_friends/add_friend_controller.dart';
import 'package:secured_chat_app/screens/add_friends/components/friend_card.dart';
import 'package:secured_chat_app/screens/add_friends/components/friend_request_card.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  AddFriendController addFriendController = Get.find();

  @override
  Widget build(BuildContext context) {
    addFriendController.getFriendRequests();
    addFriendController.getFriendsList();

    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RoundedButton(
                text: "+ Yeni Arkadaş Ekle",
                press: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Arkadaş İsteği Gönder'),
                      content: RoundedInputField(
                        textEditingController:
                            addFriendController.emailController,
                        hintText: "E-Mail",
                        onChanged: (value) {},
                      ),
                      actions: <Widget>[
                        Obx(
                          () => RoundedButton(
                            text: addFriendController.addFriendLoading.value
                                ? "Arkadaş isteği gönderiliyor.."
                                : "Gönder",
                            press: () {
                              addFriendController.addFriend();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Obx(
                () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: addFriendController.getFriendRequestList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (FriendRequestCard(
                        index: index,
                        id: addFriendController
                            .getFriendRequestList.value[index].id,
                        name: addFriendController
                            .getFriendRequestList.value[index].fromEmail));
                  },
                ),
              ),
              Obx(
                () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: addFriendController.getFriendList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (FriendCard(
                        index: index,
                        id: addFriendController.getFriendList.value[index].id,
                        email: addFriendController
                            .getFriendList.value[index].email));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // (FriendRequestCard());
  }
}

// Future<void> _showMyDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('AlertDialog Title'),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: const <Widget>[
//               Text('This is a demo alert dialog.'),
//               Text('Would you like to approve of this message?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Approve'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

Widget build(BuildContext context) {
  return TextButton(
    onPressed: () => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    ),
    child: const Text('Show Dialog'),
  );
}
