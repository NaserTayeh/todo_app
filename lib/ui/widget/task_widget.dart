import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_todo/models/task_model.dart';
import 'package:flutter_application_todo/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  TaskWidget(this.taskModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: taskModel.isComplete! ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(10)),
      child: CheckboxListTile(
        secondary: IconButton(
            onPressed: () {
              Provider.of<TodoClass>(context, listen: false)
                  .deleteTask(taskModel);
            },
            icon: Icon(Icons.delete)),
        value: taskModel.isComplete,
        onChanged: (v) {
          Provider.of<TodoClass>(context, listen: false).updateTask(taskModel);
        },
        title: Text(taskModel.title ?? ''),
      ),
    );
  }
}
