import 'package:flutter/material.dart';
import 'package:provider/provider.dart'
;
import '../model/task_data.dart';

class CompletedTaskScreen extends StatelessWidget {
  //Navigasi screen
  static const routeName = '/completedTask';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Task'),
      ),
      //ListView menampilkan daftar task completed
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Text('${index + 1}'),
                title: Text(
                  Provider.of<TaskData>(context, listen: false)
                      .completedTask[index]
                      .title,
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
              Divider()
            ],
          );
        },
        itemCount: Provider.of<TaskData>(context).completedTask.length,
      ),
    );
  }
}
