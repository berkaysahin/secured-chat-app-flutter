class Message {
  final String sender;
  final String to;
  final String message;
  final String sendDate;
  final bool read;

  Message({
    this.sender,
    this.to,
    this.message,
    this.sendDate,
    this.read,
  });

  Message.fromJson(Map json)
      : sender = json['sender'],
        to = json['to'],
        message = json['message'],
        sendDate = json['sendDate'] == null ? '' : json['sendDate'].toString(),
        read = json['read'];

  get value => null;
}
