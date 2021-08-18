import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task_data.dart';
import 'package:todoey/utils/snacbar.dart';
import 'package:todoey/widget/task_tile.dart';
import '../utils/snacbar.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Consumer digunakan untuk memeprsingkat penulisan Provider.of<IsiData>(context).blaalba jika ada banyak
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) {
          //Variabel tampung taskData index spesifik
          final data = taskData.task[index];
          return Column(
            children: [
              TaskTile(
                title: data.title,
                isDone: data.isDone,
                checkBoxCallBack: () {
                  taskData.updateTask(data);
                  Util u = new Util();
                  u.snackBar(context, 'Task Completed');
                },
                callBackLongPress: () {
                  taskData.deleteTask(data);
                  Navigator.of(context).pop();
                  Util u = new Util();
                  u.snackBar(context, 'Task Succesfull Deleted');
                },
              ),
              Divider(),
            ],
          );
        },
        itemCount: taskData.taskCount,
      ),
    );
  }

}
