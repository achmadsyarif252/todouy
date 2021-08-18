import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:provider/provider.dart';

import '../model/task_data.dart';
import '../utils/snacbar.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  //TextController untuk textfield
  final TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Container hampir transparan untuk overlay
    return Container(
      color: Color.fromRGBO(117, 117, 117, 1),
      child: Container(//=>Container putih dengan bagian atas melengkung
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          //Kolom untuk judul ,teksfield dan flatbutton
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 40.0,
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: txtController,
                autofocus: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                height: 50.0,
                color: Colors.blue,
                onPressed: () {
                  //Validasi jika teks kosong
                  if (txtController.text.isNotEmpty) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(txtController.text);
                  }
                  Navigator.of(context).pop();
                  //Panggil snackbar pada class Util
                  Util u = new Util();
                  u.snackBar(context, 'Task Added Successfuly');
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
