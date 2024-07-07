import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/chat_message.dart';
import '../models/chat_session.dart';

class StorageService extends ChangeNotifier {
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'gpt_chat.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE api_keys(id INTEGER PRIMARY KEY, api_key TEXT)"
        );
        await db.execute(
          "CREATE TABLE chat_messages(id INTEGER PRIMARY KEY, session_id INTEGER, message TEXT, sender INTEGER)"
        );
        await db.execute(
          "CREATE TABLE chat_sessions(id INTEGER PRIMARY KEY, title TEXT, created_at TEXT)"
        );
      },
    );
  }

  Future<bool> saveApiKey(String apiKey) async {
    final db = await database;

    try {
      await db.insert(
        'api_keys',
        {'api_key': apiKey},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  // Add other CRUD operations methods here
}
