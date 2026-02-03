import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlliteModel {
  static final SqlliteModel _instance = SqlliteModel._internal();
  factory SqlliteModel() => _instance;

  SqlliteModel._internal();

  static Database? _database;

  Future<Database> get database async {
    return _database ??= await _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_data.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id TEXT NOT NULL,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      token TEXT NOT NULL
    )
  ''');

    await db.execute('''
    CREATE TABLE user_prefrences (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      theme TEXT NOT NULL,
      language TEXT NOT NULL,
      notification TEXT NOT NULL
    )
  ''');
  }

  Future<int> insertUserPrefrence() async {
    final db = await database;
    return await db.insert('user_prefrences',
        {'theme': "light", 'language': "en", 'notification': "false"});
  }

  Future<List<Map<String, dynamic>>> getUserPrefrence() async {
    final db = await database;
    return await db.query('user_prefrences');
  }

  Future<int> updateUserPrefrence({
    String? theme,
    String? language,
    String? notification,
    required int prefrenceId,
  }) async {
    final db = await database;

    final updateData = <String, dynamic>{};
    if (theme != null) updateData['theme'] = theme;
    if (language != null) updateData['language'] = language;
    if (notification != null) updateData['notification'] = notification;

    if (updateData.isEmpty) return 0;

    return await db.update(
      'user_prefrences',
      updateData,
      where: 'id = ?',
      whereArgs: [prefrenceId],
    );
  }

  // Future<int> updateUserPrefrence({required String theme, required String language, required String notification, required int prefrenceId}) async {
  //   final db = await database;
  //   return await db.update(
  //     'user_prefrences',
  //     {'theme': theme, 'language': language, 'notification': notification},
  //     where: 'id = ?',
  //     whereArgs: [prefrenceId],
  //   );
  // }

  // Future<int> insertUser(String name, String email) async {
  //   final db = await database;
  //   return await db.insert('users', {
  //     'name': name,
  //     'email': email,
  //   });
  // }

  // Future<List<Map<String, dynamic>>> getUsers() async {
  //   final db = await database;
  //   return await db.query('users');
  // }
  // Future<int> updateUser(int id, String name, String email) async {
  //   final db = await database;
  //   return await db.update(
  //     'users',
  //     {'name': name, 'email': email},
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }

  // Future<int> deleteUser(int id) async {
  //   final db = await database;
  //   return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  // }
}
