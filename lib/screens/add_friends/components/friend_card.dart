import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendCard extends StatelessWidget {
  final String name;

  const FriendCard({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
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
