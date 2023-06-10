// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_todo/data_repository/db_helper.dart';
import 'package:flutter_application_todo/providers/todo_provider.dart';
import 'package:flutter_application_todo/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'ui/screens/todo_main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DbHelper.dbHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoClass>(
        create: (context) {
          return TodoClass();
        },
        child: AppInit());
  }
}

class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // themeMode: ThemeMode.light,
        theme: Provider.of<TodoClass>(context).isDarkMode
            ? ThemeData.dark()
            : ThemeData.light(),
        // theme: ThemeData(scaffoldBackgroundColor: Colors.yellow),
        title: 'gsk',
        home: SplachScreen()
        //  TodoMainScreen(),
        );
  }
}
