// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secured_chat_app/components/rounded_button.dart';
import 'package:secured_chat_app/components/rounded_input_field.dart';
import 'package:secured_chat_app/models/screen_enum.dart';
import 'package:secured_chat_app/screens/add_friends/add_friend_controller.dart';
import 'package:secured_chat_app/screens/add_friends/components/friend_card.dart';
import 'package:secured_chat_app/screens/add_friends/components/friend_request_card.dart';
import 'package:secured_chat_app/services/socket_controller.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  AddFriendController addFriendController = Get.find();
  SocketController socketController = Get.find();

  @override
  Widget build(BuildContext context) {
    socketController.activeScreen.value = ScreenEnum.Others;
    socketController.activeChatFriendId.value = "";

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
                            press: () async {
                              var friendId = await addFriendController.addFriend();
                              var result = await addFriendController.getDHParameters(friendId.toString());
                              
                              var numberP = BigInt.parse(result["numberP"].toString());
                              var numberG = BigInt.parse(result["numberG"].toString());

                              // burasi kalici olmasi gerekiyor
                              GetStorage().write("numberP", numberP);

                              var myKey = BigInt.parse(
                                  "5E8B02F2B2E9C96E0C359ECD14EB1B29EBDD61E70A61E42F0836A5974963E96D91F1462B699C222BC92BC068E9DCE5C78E4349D28DDCB6D0ED2C41F7CD8AF2418C8AE27B6909484DED7F0C5B4C286D9C36518FA5953974741B3A6F757B59A41A5CA0B74EFD919BB7ED8CCEC9CB3BC4B4F8D15D16DC4642E54691904B2F35B969",
                                  radix: 16);
                                  
                              var myPublicKey = numberG.modPow(myKey, numberP);
                              result = await addFriendController.setPublicKey(myPublicKey.toString(), friendId);

                              // Navigator.pop(context);
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
                            .getFriendRequestList.value[index].fromEmail,
                        senderUserId: addFriendController
                            .getFriendRequestList.value[index].senderUserId));
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
