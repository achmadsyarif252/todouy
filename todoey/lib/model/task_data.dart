import 'dart:collection';
import 'package:flutter/material.dart';

import '../model/task.dart';

//Buat class Task Provider
class TaskData extends ChangeNotifier {

  //Data source task dengan 3 data dummy
  List<Task> _task = [
    Task(title: 'Buy eggs'),
    Task(title: 'Buy milk'),
    Task(title: 'Buy indomie'),
  ];

  //Buat method get task yang aktif untuk keamanan agar _task tidak dapat diakses langsung
  UnmodifiableListView get task {
    return UnmodifiableListView(_task.where((task) => task.isDone == false));
  }

  //Buat method get task completed untuk keamanan agar _task tidak dapat diakses langsung
  UnmodifiableListView get completedTask {
    return UnmodifiableListView(_taskComplete);
  }

  //Buat list untuk menampung data task yang sudah selesai
  List<Task> _taskComplete = [];

  //Getter jumlah task aktif
  int get taskCount {
    //Mencari data task pada _task dengan kondisi selesai=false
    return _task.where((tsk) => tsk.isDone == false).length;
  }

  //Method updateStatus ke selesai dan tidak dengan parameter Task Object
  void updateTask(Task task) {
    task.toggleDone();
    _taskComplete.add(task);
    notifyListeners();
  }

  //Method tambah task parameter Task Object
  void addTask(String newTask) {
    final task = Task(title: newTask);
    _task.add(task);
    notifyListeners();
  }

  //Method delete task parameter Task Object
  void deleteTask(Task task) {
    _task.remove(task);
    notifyListeners();
  }
}
