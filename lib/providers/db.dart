import 'package:notes/providers/firebase_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '/models/notes_model.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;
  NotesDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('NewNotes.db');
    return _database;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''CREATE TABLE Notes(
      ${MyNotesImp.id} $idType,
      ${MyNotesImp.pin} $boolType,
      ${MyNotesImp.isArchive} $boolType,
      ${MyNotesImp.isDeleted} $boolType,
      ${MyNotesImp.title} $textType,
      ${MyNotesImp.uniqueId} $textType,
      ${MyNotesImp.content} $textType,
      ${MyNotesImp.createdTime} $textType
  
    ) ''');
  }

  Future<MyNotes?> insertNote(MyNotes note) async {
    final db = await instance.database;
    final id = await db!.insert(MyNotesImp.TableName, note.toJson());
    await FireDB().createNewNoteFirestore(note);
    return note.copy(id: id);
  }

  Future<List<MyNotes>> getAllNotes() async {
    final db = await instance.database;
    final orderBy = '${MyNotesImp.createdTime} ASC';
    final query_result =
        await db!.query(MyNotesImp.TableName, orderBy: orderBy);
    return query_result.map((json) => MyNotes.fromJson(json)).toList();
  }

  Future<MyNotes?> getOneNote(int id) async {
    final db = await instance.database;
    final map = await db!.query(MyNotesImp.TableName,
        columns: MyNotesImp.values,
        where: '${MyNotesImp.id} = ?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return MyNotes.fromJson(map.first);
    } else {
      return null;
    }
  }

  Future updateNote(MyNotes note) async {
    await FireDB().updateNoteFirestore(note);
    final db = await instance.database;
    await db!.update(MyNotesImp.TableName, note.toJson(),
        where: '${MyNotesImp.id} = ?', whereArgs: [note.id]);
  }

  Future deleteNote(MyNotes note) async {
    await FireDB().deleteNoteFirestore(note);
    final db = await instance.database;
    await db!.delete(MyNotesImp.TableName,
        where: '${MyNotesImp.id} = ?', whereArgs: [note.id]);
  }

  Future pinNote(MyNotes note) async {
    final db = await instance.database;
    await db!.update(MyNotesImp.TableName, {MyNotesImp.pin: note.pin ? 1 : 0},
        where: '${MyNotesImp.id} = ?', whereArgs: [note.id]);
  }

  Future archiveNote(MyNotes note) async {
    final db = await instance.database;
    await db!.update(
        MyNotesImp.TableName, {MyNotesImp.isArchive: note.isArchive ? 1 : 0},
        where: '${MyNotesImp.id} = ?', whereArgs: [note.id]);
  }

  Future<List<int>> getNoteString(String query) async {
    final db = await instance.database;
    final result = await db!.query(MyNotesImp.TableName);
    List<int> resultIds = [];
    result.forEach((element) {
      if (element["title"].toString().toLowerCase().contains(query) ||
          element["content"].toString().toLowerCase().contains(query)) {
        resultIds.add(element["id"] as int);
      }
    });
    return resultIds;
  }
}
