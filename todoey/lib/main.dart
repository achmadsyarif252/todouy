import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task_data.dart';
import 'package:todoey/screen/completed_task_screen.dart';
import 'screen/task_screen.dart';
import 'model/task_data.dart';

//Main
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ChangeNotifier di puncak widget tree agar semua data pada class turunan bisa menggunakannya
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
        routes: {
          CompletedTaskScreen.routeName: (context) => CompletedTaskScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Todoey',
      ),
    );
  }
}
