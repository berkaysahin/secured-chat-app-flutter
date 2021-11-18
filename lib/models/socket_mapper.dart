import 'package:object_mapper/object_mapper.dart';

class SocketMapper with Mappable {
  int id;

  @override
  void mapping(Mapper map) {
    map("id", id, (v) => id = v);
  }
}
