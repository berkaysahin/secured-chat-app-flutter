import 'package:flutter/material.dart';
import 'package:secured_chat_app/models/friends_model.dart';
import 'package:secured_chat_app/screens/add_friends/components/friend_card.dart';
import 'package:secured_chat_app/screens/add_friends/components/friend_request_card.dart';
import 'package:secured_chat_app/models/friend_request_model.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: friendRequests.length,
                itemBuilder: (BuildContext context, int index) {
                  final FriendRequest friendRequest = friendRequests[index];
                  return (FriendRequestCard(name: friendRequest.name));
                },
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: friends.length,
                itemBuilder: (BuildContext context, int index) {
                  final Friend friend = friends[index];
                  return (FriendCard(name: friend.name));
                },
              ),
            ],
          ),
        ),
      ),
    );
    // (FriendRequestCard());
  }
}
