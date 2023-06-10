// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, unused_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_todo/providers/todo_provider.dart';
import 'package:flutter_application_todo/ui/screens/all_tasks.dart';
import 'package:flutter_application_todo/ui/screens/complete_tasks_.dart';
import 'package:flutter_application_todo/ui/screens/incomplete_tasks.dart';
import 'package:flutter_application_todo/ui/screens/new_task_screen.dart';
import 'package:provider/provider.dart';

class TodoMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showCustomDialoud(String message, String title) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
              contentTextStyle: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              backgroundColor: Colors.green[400],
              title: Text(title),
              content: Text(message),
            );
          });
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'complete',
              ),
              Tab(
                text: 'incomelete',
              ),
            ]),
            title: Text('Todo Main page'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return NewTasksScreen();
                    }));
                  },
                  icon: Icon(Icons.add)),
              IconButton(
                  onPressed: () {
                    Icon(Provider.of<TodoClass>(context, listen: false)
                        .changeIsDarkMode());
                  },
                  icon: Icon(Provider.of<TodoClass>(context).isDarkMode
                      ? Icons.light_mode
                      : Icons.dark_mode))
            ],
          ),
          body: TabBarView(
            children: [
              AllTasksScreen(),
              CompleteTasksScreen(),
              InComleteTasksScreen(),
            ],
          )),
    );
  }
}
// اعمل زر يغير قيمة ال age

/*
1- create class that you will save data in 
2- create object for this class above material app
3- use the object in any ui using inherted widget syntax
*/
// return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 CheckboxListTile(
//                   title: Text('You must wait until 8:00 pm'),
//                   value: Provider.of<TodoClass>(context).acceptCondition,
//                   onChanged: (v) {
//                     Provider.of<TodoClass>(context, listen: false)
//                         .changeConditionValue(
//                             !Provider.of<TodoClass>(context, listen: false)
//                                 .acceptCondition);
//                   },
//                 ),
//                 Text(Provider.of<TodoClass>(context).acceptCondition
//                     ? 'You accept my condition'
//                     : 'You do not accept my condition'),
//                 Text(
//                   Provider.of<TodoClass>(context).name.toString(),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 30),
//                 ),
//                 ElevatedButton(
//                     onPressed: () {
//                       //اي مكان ما بلزمني احدث ال ui باي تغيير بستخدم الصيفغه هاي
//                       // بستخدم الل listen flase لما ما بلزمني التغيير يلي بصير
//                       Provider.of<TodoClass>(context, listen: false)
//                           .changeName("neymar");
//                     },
//                     child: Text('Change Name attribute'))
//               ],
//             );