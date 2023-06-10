import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../providers/todo_provider.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Task Screen'),
        ),
        body: Consumer<TodoClass>(
          builder: (context, Provider, x) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: Provider.textEditingController,
                  decoration: const InputDecoration(label: Text('Task title')),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.insertNewTask();
                    },
                    child: const Text('add new Task'))
              ],
            );
          },
        ));
  }
}
