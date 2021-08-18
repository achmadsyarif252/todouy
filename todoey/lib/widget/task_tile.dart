import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todoey/utils/snacbar.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function checkBoxCallBack;
  final Function callBackLongPress;

  TaskTile({
    required this.title,
    required this.isDone,
    required this.checkBoxCallBack,
    required this.callBackLongPress,
  });

  @override
  Widget build(BuildContext context) {
    //WIdget untuk slide kanan/kiri confirm hapus
    return Dismissible(
      key: ValueKey(title),
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) {
        //Dialog konfitmasi hapus task
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Delete'),
                content: Text('Delete this task ?'),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No'),
                  ),
                  FlatButton(
                    onPressed: () {
                      callBackLongPress();
                    },
                    child: Text('Yes'),
                  ),
                ],
              );
            });
      },
      background: Container(
        color: Colors.red,
        child: ListTile(
          title: Text(
            'Delete this task ?',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: ListTile(
        onLongPress: () => callBackLongPress(),
        hoverColor: Colors.blue,
        selectedTileColor: Colors.blue,
        title: Text(
          title,
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isDone,
          onChanged: (checkBoxState) {
            checkBoxCallBack();
          },
        ),
      ),
    );
  }
  }
