import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper
{
    static Database? _db;

    static Future<Database> initDB() async
    {
        if (_db != null) return _db!;

        final dbPath = await getDatabasesPath();
        String path = join(dbPath, "my_db.db");

        _db = await openDatabase(
            path,
            version: 1,
            onCreate: (db, version) async
            {
                await db.execute('''
        CREATE TABLE notes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT
        )
        ''');
            }
        );

        return _db!;
    }

    static Future<int> insertData(String title, String content) async
    {
        final db = await initDB();
        return await db.insert("notes", {"title": title, "content": content});
    }

    static Future<List<Map<String, dynamic>>> getData() async
    {
        final db = await initDB();
        return await db.query("notes");
    }

    static Future<int> updateData(int id, String title, String content) async
    {
        final db = await initDB();
        return await db.update("notes", 
            {
                "title": title,
                "content": content
            }, where: "id = ?", whereArgs: [id]
        );
    }
    
    static Future<int> deleteData(int id) async {
      final db = await initDB();
      return await db.delete("notes", where: "id = ?", whereArgs: [id]);
    }
}
