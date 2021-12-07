class MessageBox {
  final String friendId;
  final String nickname;
  final String message;
  final String sendDate;
  final String lastSenderUserId;
  final bool read;

  MessageBox({
    this.friendId,
    this.nickname,
    this.message,
    this.sendDate,
    this.lastSenderUserId,
    this.read,
  });

  MessageBox.fromJson(Map json)
      : friendId = json['friendId'],
        nickname = json['nickname'],
        message = json['message'],
        sendDate = json['sendDate'] == null
            ? ''
            : json['sendDate']
                .toString(), //json['sendDate'].toString() DateTime,
        lastSenderUserId = json['lastSenderUserId'],
        read = json['read'];

  get value => null;
}
