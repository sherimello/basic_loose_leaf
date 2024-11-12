import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? _database;
  
  Database get database => _database!;
  
  initDB() async{
    var db = await openDatabase(join(await getDatabasesPath(), "my leaves.db"),
    onCreate: (db, version) {
      db.execute("CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY, title TEXT, note TEXT)");
    },
      version: 1
    );

    _database = db;

  }

  insertNote(Database database, String title, String note) async{
    await database.rawInsert("INSERT INTO notes (title, note) VALUES (?,?)", [title, note]);
  }

  fetchNotes(Database database) async {
    List<Map<String, Object?>>? data;

    data = await database.rawQuery("SELECT * FROM notes");

    print(data);

    return data;

  }

  deleteNote(Database database, int id) async{
    await database.rawDelete("DELETE FROM notes WHERE id = ?", [id]);
  }
  
}