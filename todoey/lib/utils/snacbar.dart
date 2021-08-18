import 'package:flutter/material.dart';

//Class Utils untuk menampilkan snackbar
class Util {
  void snackBar(BuildContext context, String teks) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(teks),
        backgroundColor: Colors.black87,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
