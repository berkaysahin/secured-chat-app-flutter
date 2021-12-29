// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:secured_chat_app/screens/message/message_screen.dart';
import 'package:secured_chat_app/screens/message_box/message_box_controller.dart';
import 'package:secured_chat_app/services/urls.dart';

class MessageBoxCard extends StatelessWidget {
  final String friendId;
  final String nickname;
  final String message;
  final String sendDate;
  final bool read;
  final bool isOnline = false;
  final String avatarUrl;

  MessageBoxCard({
    Key key,
    @required this.friendId,
    @required this.nickname,
    @required this.message,
    @required this.sendDate,
    @required this.read,
    @required this.avatarUrl,
  }) : super(key: key);

  MessageBoxController messageBoxController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var publicKey = BigInt.parse((await messageBoxController.getPublicKey(friendId)).toString());
        BigInt myKey;

        if(GetStorage().read('id') == "41863d38-3502-4b37-a5b4-8333c37b7e45"){
          myKey = BigInt.parse(
             "5E8B02F2B2E9C96E0C359ECD14EB1B29EBDD61E70A61E42F0836A5974963E96D91F1462B699C222BC92BC068E9DCE5C78E4349D28DDCB6D0ED2C41F7CD8AF2418C8AE27B6909484DED7F0C5B4C286D9C36518FA5953974741B3A6F757B59A41A5CA0B74EFD919BB7ED8CCEC9CB3BC4B4F8D15D16DC4642E54691904B2F35B969",
             radix: 16);
        }
        else {
          myKey = BigInt.parse(
                        "42111D3A7ECAA6A83E503825F38629AD9754D93370D681AEFEE152329D8DAE6C20732C5A7B6393DEDDB62753CEEFAE0A5E1BD037A5A32364CE1375442E58997C2918563EE5D7452373847AABAD5A5D02DF289B3A0B9096A375AE509F16363B4573A5CCCDFFF2B60459D52C0E5280853000CE6268560A95111723AF5916CC8376",
                        radix: 16);
        }
        
        // burdaki sayi yerine dbden numberP gelmeli
        var crypto = publicKey.modPow(myKey, BigInt.parse("174039042611836372946993172752709376900098549396995175728039697797106760517050782790397762086994283374495192214733414965220258247330826468251072631906063293500431283001154921460195126689288983809068863209875354114177708642776560081696199516313195123855442496293494974518181485717816207923623095047478869135359"));
      
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              nickname: nickname,
              friendId: friendId,
              isOnline: isOnline,
              avatarUrl: avatarUrl,
              crypto : crypto.toString()
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(2),
              decoration: (message != "" && !read)
                  ? BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                      // shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    )
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: (avatarUrl == null || avatarUrl == '')
                    ? const AssetImage('assets/images/person.jpg')
                    : NetworkImage(urlAvatarImages + avatarUrl),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            nickname,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          (message != "" && !read)
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  width: 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Container(
                                  child: null,
                                ),
                        ],
                      ),
                      Text(
                        sendDate == ''
                            ? ''
                            : DateFormat("yyyy-MM-dd HH:mm:ss")
                                .format(DateTime.parse(sendDate))
                                .toString(),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
