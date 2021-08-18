import 'package:flutter/material.dart';

//Buat class model unutuk task dengan properti title dan isDone
class Task {
  final String title;
  bool isDone;

  //Construct untuk pertama kali dimuat
  Task({required this.title, this.isDone = false});

  //Method untuk mengubah nilai isDone
  bool toggleDone() {
    return isDone = !isDone;
  }
}
