import 'package:flutter/material.dart';

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
                    Scaffold.of(context)
                        // ignore: deprecated_member_use
                        .showSnackBar(
                            const SnackBar(content: Text("Arkadaş eklendi.")));
                  },
                  icon: const Icon(Icons.check)),
              IconButton(
                  onPressed: () {
                    Scaffold.of(context)
                        // ignore: deprecated_member_use
                        .showSnackBar(
                            const SnackBar(content: Text("İstek reddedildi.")));
                  },
                  icon: const Icon(Icons.clear)),
            ],
          ),
        ),
      ),
    );
  }
}
