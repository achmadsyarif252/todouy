import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task_data.dart';
import '../screen/add_task_screen.dart';
import '../screen/completed_task_screen.dart';
import '../widget/task_list.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          //Container bagian atas
          Container(
            padding: const EdgeInsets.all(30.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                      ),
                    ),
                    Text(
                      'Todowey',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${Provider.of<TaskData>(context).taskCount} Task Incomplete',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ],
                ),
                //Tombol popup menu pada pojok kanan atas
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushNamed(CompletedTaskScreen.routeName);
                        },
                        child: Text('Complete Task'),
                      ),
                    ),
                  ],
                  icon: Icon(
                    Icons.more_vert,
                    size: 30.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          //Container bagian listview task incomplete
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              //Validasi jika jumlah task lebih dari 0
              child: Provider.of<TaskData>(context).taskCount != 0
                  ? TaskList()
                  : Center(
                      child: Text(
                        'Task is Empty\nPlease Add New Task',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
