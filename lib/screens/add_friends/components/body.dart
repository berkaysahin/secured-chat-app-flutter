import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child : ListTile(
            title: const Text('burak.yazan'),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context)
                        // ignore: deprecated_member_use
                      .showSnackBar(
                        const SnackBar(content: Text("Arkadaş eklendi."))
                      );
                    }, 
                    icon: const Icon(Icons.add_box)),
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context)
                        // ignore: deprecated_member_use
                      .showSnackBar(
                        const SnackBar(content: Text("İstek reddedildi."))
                      );
                    }, 
                    icon: const Icon(Icons.delete)),
                ],
              ),
            ),
          )
        ),
        Card(
          child : ListTile(
            title: const Text('burak.yazan'),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context)
                        // ignore: deprecated_member_use
                      .showSnackBar(
                        const SnackBar(content: Text("Arkadaş eklendi."))
                      );
                    }, 
                    icon: const Icon(Icons.add_box)),
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context)
                        // ignore: deprecated_member_use
                      .showSnackBar(
                        const SnackBar(content: Text("İstek reddedildi."))
                      );
                    }, 
                    icon: const Icon(Icons.delete)),
                ],
              ),
            ),
          )
        ),
        Card(
          child : ListTile(
            title: const Text('berkay.sahin'),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context)
                        // ignore: deprecated_member_use
                      .showSnackBar(
                        const SnackBar(content: Text("Arkadaş eklendi."))
                      );
                    }, 
                    icon: const Icon(Icons.add_box)),
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context)
                        // ignore: deprecated_member_use
                      .showSnackBar(
                        const SnackBar(content: Text("İstek reddedildi."))
                      );
                    }, 
                    icon: const Icon(Icons.delete)),
                ],
              ),
            ),
          )
        ),
      ]
    );
  }
}