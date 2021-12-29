class FriendRequest {
  final String id;
  final String fromEmail;
  final String senderUserId;

  FriendRequest({
    this.id,
    this.fromEmail,
    this.senderUserId
  });

  FriendRequest.fromJson(Map json)
      : id = json['id'],
        fromEmail = json['fromEmail'],
        senderUserId = json['senderUserId'];

  get value => null;

  Map toJson() {
    return {'id': id, 'fromEmail': fromEmail, "senderUserId" : senderUserId};
  }
}
