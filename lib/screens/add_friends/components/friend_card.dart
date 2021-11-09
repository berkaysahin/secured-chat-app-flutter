import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendCard extends StatelessWidget {
  final int index;
  final String id;
  final String email;

  const FriendCard({
    Key key,
    @required this.index,
    @required this.id,
    @required this.email,
  }) : super(key: key);

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
                  onPressed: () {
                    Get.snackbar("Başarılı", "Arkadaş silindi.");
                  },
                  icon: const Icon(Icons.remove)),
            ],
          ),
        ),
      ),
    );
  }
}
