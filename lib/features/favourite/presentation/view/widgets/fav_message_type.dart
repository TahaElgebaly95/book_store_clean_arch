import 'package:flutter/material.dart';

enum FavMessageType {
  success(Colors.green),
  error(Colors.red),
  warning(Colors.orange),
  info(Colors.blue);

  final Color color;
  const FavMessageType(this.color);
}