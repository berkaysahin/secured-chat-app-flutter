class FriendRequest {
  final int id;
  final String name;
  final String imageUrl;

  FriendRequest({
    this.id,
    this.name,
    this.imageUrl,
  });
}

List<FriendRequest> friendRequests = [
  FriendRequest(
    id: 0,
    name: 'Kullanıcı1',
    imageUrl: 'assets/images/person.jpg',
  ),
  FriendRequest(
    id: 1,
    name: 'Kullanıcı2',
    imageUrl: 'assets/images/person.jpg',
  ),
];
