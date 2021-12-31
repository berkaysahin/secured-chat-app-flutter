import 'dart:async';
import 'package:path/path.dart';
import 'package:secured_chat_app/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "SecuredChatApp.db");

    return await openDatabase(path, onCreate: _onCreate, version:2);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    return await db.execute("CREATE TABLE IF NOT EXISTS Users(id INTEGER PRIMARY KEY, email TEXT, secureKey TEXT)");
  }

  Future<User> getUser(String email) async {
    var dbClient = await db;
    var result = await dbClient.query("Users",
        columns: ["id", "email", "secureKey"],
        where: 'email = ?',
        whereArgs: [email]);

    if(result.isEmpty) {
      return null;
    }
    var response = result.map((data) => User.fromMap(data)).toList();

    return response[0];
  }

  Future<int> insertUser(User user) async{
    var dbClient = await db;
    return await dbClient.insert("Users", user.toMap());
  }
}