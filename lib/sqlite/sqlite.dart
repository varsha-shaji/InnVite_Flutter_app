import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/users.dart';
class DatabaseHelper {
  final databaseName = "InnVite.db";

  String users = '''
    CREATE TABLE users (
      usrId INTEGER PRIMARY KEY AUTOINCREMENT, 
      name TEXT NOT NULL, 
      usrPassword TEXT NOT NULL, 
      usrEmail TEXT UNIQUE NOT NULL, 
      usrPhone TEXT NOT NULL, 
      usrAddress TEXT NOT NULL
    )
  ''';

  //We are done in this section

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
    });
  }


  //Login Method

  Future<bool> login(String email, String password) async {
    final Database db = await initDB();
    var result = await db.query(
      'users',
      where: 'usrEmail = ? AND usrPassword = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  //Sign up
  Future<int> signup(Users user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }

  Future<Users?> getUserByEmail(String email) async {
    final Database db = await initDB();
    var result = await db.query(
      'users',
      where: 'usrEmail = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return Users.fromMap(result.first);
    }
    return null;
  }

}
