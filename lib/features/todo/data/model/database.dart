import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './todo.dart';

class DatabaseConnection {
  Database? _database;

  Future<Database> get database async {
    final dataBasePath = await getDatabasesPath();
    const dataBaseName = 'todo.db';
    final path = join(dataBasePath, dataBaseName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDataBase
    );

    return _database!;
  }

  Future<void> _createDataBase(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT,
        createdOn TEXT,
        isFinished INTEGER
      )
      '''
    );
  }

  Future<void> addTodo (Todo todo) async {
    final db = await database;
    await db.insert(
      'todo', 
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<void> deleteTodo (Todo todo) async {
    final db = await database;
    await db.delete(
      'todo',
      where: 'id == ?',
      whereArgs: [todo.id]
    );
  }

  Future<List<Todo>> getTodos() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id DESC' 
    );
    return List.generate(
      items.length, 
      (index) => Todo.toTodoObject(items[index])
    );
  }
}