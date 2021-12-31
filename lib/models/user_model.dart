class User {
  int id;
  String email;
  String secureKey;

  User({this.email, this.secureKey});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["email"] = email;
    map["secureKey"] = secureKey;
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    email = map["email"];
    secureKey = map["secureKey"];
  }
}