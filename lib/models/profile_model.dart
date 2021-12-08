class Profile {
  final String nickname;
  final String email;
  final String imageUrl;

  Profile({
    this.nickname,
    this.email,
    this.imageUrl,
  });

  Profile.fromJson(Map json)
      : nickname = json['nickname'],
        email = json['email'],
        imageUrl = json['imageUrl'];

  get value => null;
}
