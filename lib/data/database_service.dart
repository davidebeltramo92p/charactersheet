import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._();
  static final DatabaseService instance = DatabaseService._();

  static const _dbName = 'charactersheet.db';
  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        final schemaSql = await rootBundle.loadString('db/schema.sql');
        final seedSql = await rootBundle.loadString('db/seed.sql');

        await _executeBatch(db, schemaSql);
        await _executeBatch(db, seedSql);
      },
    );
  }

  Future<void> _executeBatch(Database db, String script) async {
    final commands = script
        .split(';')
        .map((stmt) => stmt.trim())
        .where((stmt) => stmt.isNotEmpty);

    for (final command in commands) {
      await db.execute(command);
    }
  }
}
