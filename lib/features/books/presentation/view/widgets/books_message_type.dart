import 'package:flutter/material.dart';

enum BooksMessageType {
  success(Colors.green),
  error(Colors.red),
  warning(Colors.orange),
  info(Colors.blue);

  final Color color;
  const BooksMessageType(this.color);
}