import 'dart:convert';

import 'package:path/path.dart';
import 'package:pest_gpt/src/models/pest/pest_tasks.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'pest_tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE PestTasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pestTasks TEXT NOT NULL,
        pestName TEXT NOT NULL
      )
    ''');
  }

  Future<int> addPestTask(PestTasks pestTask) async {
    final db = await database;
    String tasksJson = jsonEncode(pestTask.toJson());
    return await db.insert(
      'PestTasks',
      {
        'pestName': pestTask.pestName,
        'pestTasks': tasksJson,
      },
    );
  }

  Future<PestTasks> getPestTask(String pestName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'PestTasks',
      where: 'pestName = ?',
      whereArgs: [pestName],
    );

    if (maps.isNotEmpty) {
      var pestTaskMap = maps.first['pestTasks'];
      return PestTasks.fromJson(jsonDecode(pestTaskMap));
    } else {
      throw Exception('Pest $pestName not found');
    }
  }

  Future<List<PestTasks>> getAllPestTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('PestTasks');

    return List.generate(maps.length, (i) {
      return PestTasks.fromJson(jsonDecode(maps[i]['pestTasks']));
    });
  }

  Future<void> updateTask(String pestName, Task task) async {
    final db = await database;
    var pestTask = await getPestTask(pestName);
    var index = pestTask.tasks
        .indexWhere((element) => element.taskName == task.taskName);
    pestTask.tasks[index] = task;
    String tasksJson = jsonEncode(pestTask.toJson());
    await db.update(
      'PestTasks',
      {
        'pestName': pestTask.pestName,
        'pestTasks': tasksJson,
      },
      where: 'pestName = ?',
      whereArgs: [pestName],
    );
  }

  Future<void> deletePestTask(String pestName) async {
    final db = await database;
    await db.delete(
      'PestTasks',
      where: 'pestName = ?',
      whereArgs: [pestName],
    );
  }

  Future<void> deleteTask(String pestName, Task task) async {
    final db = await database;
    var pestTask = await getPestTask(pestName);
    pestTask.tasks.removeWhere((element) => element.taskName == task.taskName);
    await db.update(
      'PestTasks',
      pestTask.toJson(),
      where: 'pestName = ?',
      whereArgs: [pestName],
    );
  }
}
