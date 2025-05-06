import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class dogDatabase{
  static Database? db;

  Future<Database> getDatabase()async{
    final dbDirPath = await getDatabasesPath();
    final dbPath = join(dbDirPath,'dog_db.db');

    final database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        // table creation
        db.execute(
            '''CREATE TABLE dogs(id INTEGER PRIMARY KEY,name TEXT,age INTEGER)'''
        );
      }
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

  // insertion
  Future<void> inserDog(int id, String name,int age)async{
    final db = await getDB();
    await db.insert(
    'dogs',
    {
      'id':id,
      'name':name,
      'age':age
    }
    );
  }

  Future<List<Map>> getDog()async{
    final db = await getDB();

    final data = await db.query('dogs');
    for(var d in data){
      print(d);
    }
    return data;
  }

  Future<void> deleteDog(int id)async{
    final db = await getDB();

    await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future<void> updateDog(int id,String name,int age)async{
    final db = await getDB();

    db.update(
        'dogs',
        {
          'id':id,
          'name':name,
          'age':age
        },
        where: 'id = ?',
      whereArgs: [id]
        );
  }
}