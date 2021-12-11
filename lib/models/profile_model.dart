class Profile {
  final String nickname;
  final String email;
  final String avatarUrl;

  Profile({
    this.nickname,
    this.email,
    this.avatarUrl,
  });

  Profile.fromJson(Map json)
      : nickname = json['nickname'],
        email = json['email'],
        avatarUrl = json['avatarUrl'];

  get value => null;
}
