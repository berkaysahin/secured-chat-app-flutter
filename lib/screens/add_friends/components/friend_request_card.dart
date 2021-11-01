import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendRequestCard extends StatelessWidget {
  final String name;

  const FriendRequestCard({
    Key key,
    @required this.name,
  }) : super(key: key);

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
                  onPressed: () {
                    Get.snackbar("Başarılı", "Arkadaş eklendi.");
                  },
                  icon: const Icon(Icons.check)),
              IconButton(
                  onPressed: () {
                    Get.snackbar("Başarılı", "Arkadaş isteği reddedildi.");
                  },
                  icon: const Icon(Icons.clear)),
            ],
          ),
        ),
      ),
    );
  }
}
