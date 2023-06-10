// ignore_for_file: unused_import, implementation_imports, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_todo/data_repository/db_helper.dart';
import 'package:flutter_application_todo/models/task_model.dart';

class TodoClass extends ChangeNotifier {
  TodoClass() {
    getAllTasks();
  }
  String name = 'naser';
  int age = 10;
  bool isMale = true;
  bool acceptCondition = true;
  bool isDarkMode = false;
  changeIsDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  TextEditingController textEditingController = TextEditingController();
  List<TaskModel> allTasks = [];
  List<TaskModel> completeTasks = [];
  List<TaskModel> inCompleteTasks = [];
  getAllTasks() async {
    allTasks = await DbHelper.dbHelper.getAllTask();

    print("all = " + allTasks.length.toString());
    completeTasks = allTasks.where((element) => element.isComplete!).toList();
    inCompleteTasks =
        allTasks.where((element) => !element.isComplete!).toList();
    notifyListeners();
  }

  insertNewTask() async {
    TaskModel taskModel =
        TaskModel(title: textEditingController.text, isComplete: false);
    print(taskModel.title.toString());
    await DbHelper.dbHelper.insertNewTask(taskModel);
    getAllTasks();
  }

  deleteTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.deleteTask(taskModel);
    getAllTasks();
  }

  updateTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.updateTask(taskModel);
    getAllTasks();
  }

  // changeName(String newName) {
  //   name = newName;
  //   notifyListeners();
  // }

  // changeConditionValue(bool newValue) {
  //   acceptCondition = newValue;
  //   notifyListeners();
  // }
}
