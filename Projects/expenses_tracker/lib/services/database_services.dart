import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServices {
  static Database? db;

  Future<Database> getDatabase() async {
    final dbDirPath = await getDatabasesPath();
    final dbPath = join(dbDirPath, 'expense_db.db');
    final database = await openDatabase(
      dbPath,
      version: 3,
      onCreate: (db, version) {
        db.execute(
          '''CREATE TABLE expenses(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              amount INTEGER NOT NULL,
              category TEXT NOT NULL,
              description TEXT)''',
        );
        db.execute(
          '''CREATE TABLE income(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              amount INTEGER NOT NULL,
              category TEXT NOT NULL,
              description TEXT)''',
        );
        db.execute(
          '''CREATE TABLE users(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              username TEXT,
              email TEXT,
              password TEXT)''',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 3) {
          db.execute(
            '''CREATE TABLE users(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT,
                email TEXT,
                password TEXT)''',
          );
        }
      },
    );
    return database;
  }

  Future<Database> getDB() async {
    if (db != null) {
      return db!;
    } else {
      db = await getDatabase();
      return db!;
    }
  }

  Future<void> addExpense(int amount, String category, String description) async {
    final db = await getDB();

    await db.insert(
      'expenses',
      {
        'amount': amount,
        'category': category,
        'description': description,
      },
    );
  }

  Future<void> addIncome(int amount, String category, String description) async {
    final db = await getDB();

    await db.insert(
      'income',
      {
        'amount': amount,
        'category': category,
        'description': description,
      },
    );
  }

  Future<void> addUser(String username, String email, String password) async {
    final db = await getDB();
    await db.insert(
      'users',
      {
        'username': username,
        'email': email,
        'password': password,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, Object?>>> getExpense() async {
    final db = await getDB();
    final data = await db.query('expenses');
    for (var d in data) {
      print(d);
    }
    return data;
  }

  Future<List<Map<String, dynamic>>> getIncome() async {
    final db = await getDB();

    final incomeData = await db.query('income');
    for (var i in incomeData) {
      print(i);
    }
    return incomeData;
  }

  Future<int> getTotalExpenses() async {
    final db = await getDB();
    final result = await db.rawQuery('SELECT SUM(amount) as total FROM expenses');
    return result[0]['total'] != null ? result[0]['total'] as int : 0;
  }

  Future<int> getTotalIncome() async {
    final db = await getDB();
    final result = await db.rawQuery('SELECT SUM(amount) as total FROM income');
    return result[0]['total'] != null ? result[0]['total'] as int : 0;
  }

  Future<void> deleteExpense(int id) async {
    final db = await getDB();
    await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteIncome(int id) async {
    final db = await getDB();
    await db.delete(
      'income',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateExpense(int id, int amount, String category, String description) async {
    final db = await getDB();
    await db.update(
      'expenses',
      {
        'amount': amount,
        'category': category,
        'description': description,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateIncome(int id, int amount, String category, String description) async {
    final db = await getDB();
    await db.update(
      'income',
      {
        'amount': amount,
        'category': category,
        'description': description,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map?> getUser(String username) async {
    final db = await getDB();
    List<Map> results = await db.query(
      'users',
      columns: ['id', 'username', 'email', 'password'],
      where: 'username = ?',
      whereArgs: [username],
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }
}
