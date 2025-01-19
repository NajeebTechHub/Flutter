import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:expense_splitter/models/expense.dart';

class DatabaseService{
  static Database? db;

  Future<Database> getDatabase()async{
    final dbDirPath = await getDatabasesPath();
    final dbPath = await join(dbDirPath,'expense_db.db');
    final database = await openDatabase(
      dbPath,
      onCreate: (db, version){
        db.execute(
          '''CREATE TABLE expense(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          description TEXT,
          amount INTEGER,
          payer TEXT,
          shareWith TEXT,
          date TEXT,
          )
          '''
        );
      },
      version: 1,
    );
    return database;
  }

  Future<Database> getDB()async{
    if(db != null){
      return db!;
    }
    else{
      db = await getDatabase();
      return db!;
    }
  }

  Future<void> addRecord(Expense expense)async{
    final db = await getDB();

    await db.insert('expense',expense.toMap());
  }
}