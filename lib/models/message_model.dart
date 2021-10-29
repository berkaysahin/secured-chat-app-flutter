import 'package:secured_chat_app/models/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: user2,
    time: '5:30 PM',
    text: 'Mesaj 1.',
    unread: true,
  ),
  Message(
    sender: user3,
    time: '4:30 PM',
    text: 'Mesaj 2.',
    unread: true,
  ),
  Message(
    sender: user7,
    time: '3:30 PM',
    text: 'Mesaj 3.',
    unread: false,
  ),
  Message(
    sender: user6,
    time: '2:30 PM',
    text: 'Mesaj 4.',
    unread: true,
  ),
  Message(
    sender: user4,
    time: '1:30 PM',
    text: 'Mesaj 5.',
    unread: false,
  ),
  Message(
    sender: user8,
    time: '12:30 PM',
    text: 'Mesaj 6.',
    unread: false,
  ),
  Message(
    sender: user5,
    time: '11:30 AM',
    text: 'Mesaj 7.',
    unread: false,
  ),
  Message(
    sender: user9,
    time: '12:45 AM',
    text: 'Mesaj 8.',
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: user2,
    time: '5:30 PM',
    text: 'Mesaj 9.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Mesaj 10.',
    unread: true,
  ),
  Message(
    sender: user2,
    time: '3:45 PM',
    text: 'Mesaj 11.',
    unread: true,
  ),
  Message(
    sender: user2,
    time: '3:15 PM',
    text: 'Mesaj 12.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Mesaj 13.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Mesaj 14.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Mesaj 15.',
    unread: true,
  ),
  Message(
    sender: user2,
    time: '2:00 PM',
    text: 'Mesaj 16.',
    unread: true,
  ),
];
