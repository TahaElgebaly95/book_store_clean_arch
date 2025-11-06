import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Functions {
  static void showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
        backgroundColor: Colors.purple,
        timeInSecForIosWeb: 2);
  }
}
