import 'package:esgi_flutter/data/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class NoteCacheProvider {
  Database? db;

  Future initialiseDatabase() async {
    var databasePath = await getDatabasesPath();

    db = await openDatabase(join(databasePath, 'tpnotes.db'), version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table notes (
        id integer primary key autoincrement,
        title text not null, 
        date text not null,
        content text not null,
        image text not null)
      ''');
    });
  }

  Future<Note> insert(Note note) async {
    await initialiseDatabase();
    var newId = await db!.insert('notes', note.toJson());
    return Note(
        id: newId,
        title: note.title,
        date: note.date,
        content: note.content,
        image: note.image);
  }

  Future<List<Note>> getAll() async {
    await initialiseDatabase();
    var result = await db!.query('notes');
    return result.map((e) => Note.fromJson(e)).toList();
  }
}
