import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_todo/providers/todo_provider.dart';
import 'package:flutter_application_todo/ui/widget/task_widget.dart';
import 'package:provider/provider.dart';

class InComleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoClass>(builder: (context, provider, x) {
      return ListView.builder(
          itemCount: provider.inCompleteTasks.length,
          itemBuilder: (context, index) {
            return TaskWidget(provider.inCompleteTasks[index]);
          });
    });
  }
}
