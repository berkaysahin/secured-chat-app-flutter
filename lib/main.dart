import 'package:flutter/material.dart';
import 'package:secured_chat_app/constants.dart';
import 'package:secured_chat_app/screens/welcome/welcome_screen.dart';
import 'package:signalr_client/hub_connection.dart';
import 'package:signalr_client/hub_connection_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mesajlaşma Uygulaması',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: const MyHomePage(title: 'Mesajlaşma Uygulaması'),
      home: const WelcomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController messageFieldController = TextEditingController();

  // Google Android Emulator localhost 10.0.2.2
  final serverUrl = "http://10.0.2.2:5000/mainhub";
  HubConnection hubConnection;
  double width = 100.0, height = 100.0;
  Offset position;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    initSignalR();

    position = const Offset(0.0, -20.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        height: 110,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                height: 50,
                child: TextField(
                  controller: messageFieldController,
                )),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                DateTime now = DateTime.now();
                // ignore: avoid_print
                print(now.toString() + hubConnection.state.toString());
                if (hubConnection.state == HubConnectionState.Connected) {
                  await hubConnection.invoke("SendMessage", args: <Object>[
                    messageFieldController.text
                  ]); // method name
                }
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green[200],
                      Colors.white,
                      Colors.green[200],
                    ],
                  ),
                ),
                child: const Center(child: Text("Gönder")),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (hubConnection.state == HubConnectionState.Disconnected) {
            await hubConnection.start();
            setState(() {
              isConnected = true;
            });
          } else {
            await hubConnection.stop();
            setState(() {
              isConnected = false;
            });
          }

          // update icon of button
          setState(() {
            // ignore: avoid_print
            print(hubConnection.state == HubConnectionState.Disconnected
                ? 'stop'
                : 'start');
          });
        },
        tooltip: 'Start/Stop',
        child: !isConnected
            ? const Icon(Icons.play_arrow)
            : const Icon(Icons.stop),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void initSignalR() async {
    hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();

    if (hubConnection.state == HubConnectionState.Disconnected) {
      await hubConnection.start();
      setState(() {
        isConnected = true;
      });
    } else {
      await hubConnection.stop();
      setState(() {
        isConnected = false;
      });
    }

    // ignore: avoid_print
    hubConnection.onclose((error) => print('Connection close'));
    hubConnection.on("ReceiveMessage", _handleNewMessage);
  }

  void _handleNewMessage(List<Object> arguments) {
    setState(() {
      // update message
      messageFieldController.text = arguments[0].toString();
    });
  }
}
