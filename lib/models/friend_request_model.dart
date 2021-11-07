class FriendRequest {
  final String id;
  final String fromEmail;

  FriendRequest({
    this.id,
    this.fromEmail,
  });

  FriendRequest.fromJson(Map json)
      : id = json['id'],
        fromEmail = json['fromEmail'];

  get value => null;

  Map toJson() {
    return {'id': id, 'fromEmail': fromEmail};
  }
}
