class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Kullanıcı1',
  imageUrl: 'assets/images/person.jpg',
  isOnline: true,
);

// USERS
final User user2 = User(
  id: 1,
  name: 'Kullanıcı2',
  imageUrl: 'assets/images/person.jpg',
  isOnline: true,
);
final User user3 = User(
  id: 2,
  name: 'Kullanıcı3',
  imageUrl: 'assets/images/person.jpg',
  isOnline: true,
);
final User user4 = User(
  id: 3,
  name: 'Kullanıcı4',
  imageUrl: 'assets/images/person.jpg',
  isOnline: false,
);
final User user5 = User(
  id: 4,
  name: 'Kullanıcı5',
  imageUrl: 'assets/images/person.jpg',
  isOnline: false,
);
final User user6 = User(
  id: 5,
  name: 'Kullanıcı6',
  imageUrl: 'assets/images/person.jpg',
  isOnline: true,
);
final User user7 = User(
  id: 6,
  name: 'Kullanıcı7',
  imageUrl: 'assets/images/person.jpg',
  isOnline: false,
);
final User user8 = User(
  id: 7,
  name: 'Kullanıcı8',
  imageUrl: 'assets/images/person.jpg',
  isOnline: false,
);
final User user9 = User(
  id: 8,
  name: 'Kullanıcı9',
  imageUrl: 'assets/images/person.jpg',
  isOnline: false,
);
