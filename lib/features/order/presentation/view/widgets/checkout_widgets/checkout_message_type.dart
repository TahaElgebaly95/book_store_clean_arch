import 'package:flutter/material.dart';

enum CheckoutMessageType {
  success(Colors.green),
  error(Colors.red),
  warning(Colors.orange),
  info(Colors.blue);

  final Color color;
  const CheckoutMessageType(this.color);
}