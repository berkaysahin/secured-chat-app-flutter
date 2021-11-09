class Friends {
  final String id;
  final String email;

  Friends({
    this.id,
    this.email,
  });

  Friends.fromJson(Map json)
      : id = json['id'],
        email = json['with'];

  get value => null;

  Map toJson() {
    return {'id': id, 'with': email};
  }
}
