import 'package:flutter/material.dart';

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
                    Scaffold.of(context)
                        // ignore: deprecated_member_use
                        .showSnackBar(
                            const SnackBar(content: Text("Arkadaş silindi.")));
                  },
                  icon: const Icon(Icons.remove)),
            ],
          ),
        ),
      ),
    );
  }
}
