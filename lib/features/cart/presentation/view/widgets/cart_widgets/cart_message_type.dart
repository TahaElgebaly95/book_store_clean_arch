import 'package:flutter/material.dart';

enum CartMessageType {
  success(Colors.green),
  error(Colors.red),
  warning(Colors.orange),
  info(Colors.blue);

  final Color color;
  const CartMessageType(this.color);
}