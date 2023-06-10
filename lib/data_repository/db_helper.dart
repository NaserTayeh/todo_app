import 'dart:io';

import 'package:flutter_application_todo/models/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();
  final String tableName = 'tasks';
  final String idColumnName = 'id';
  final String titleColumnName = 'title';
  final String isCompleteColumnName = 'isComplete';
  initDatabase() async {
    database = await createDatabasConnection();
  }

  Future<int> insertNewTask(TaskModel taskModel) async {
    int i = await database.insert(tableName, taskModel.toMap());
    return i;
  }

  Future<List<TaskModel>> getAllTask() async {
    List<Map<String, dynamic>> data = await database.query(tableName);
    return data.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<int> deleteTask(TaskModel taskModel) async {
    int count = await database
        .delete(tableName, where: 'id=?', whereArgs: [taskModel.id]);
    return count;
  }

  updateTask(TaskModel taskModel) async {
    /*
    update tableNAme set name = value where id  = 5  
    */
    bool newValue = !(taskModel.isComplete!);
    database.update(tableName, {isCompleteColumnName: newValue},
        where: 'id=?', whereArgs: [taskModel.id]);
  }

  Future<Database> createDatabasConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String folderPath = directory.path;
    return openDatabase(folderPath + '/tasks.db', version: 1,
        onCreate: ((db, version) {
      db.execute('''CREATE TABLE $tableName (
            $idColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
             $titleColumnName TEXT,
               $isCompleteColumnName INTEGER)
          ''');
    }));
  }
}
