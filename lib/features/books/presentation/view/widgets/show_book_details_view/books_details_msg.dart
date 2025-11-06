import 'package:flutter/material.dart';

enum BookDetailsMessageType {
  success(Colors.green),
  error(Colors.red),
  warning(Colors.orange),
  info(Colors.blue);

  final Color color;
  const BookDetailsMessageType(this.color);
}