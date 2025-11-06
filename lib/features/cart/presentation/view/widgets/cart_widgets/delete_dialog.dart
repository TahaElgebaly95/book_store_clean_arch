import 'package:flutter/material.dart';

class ConfirmDelete extends StatelessWidget {
  const ConfirmDelete({super.key, required this.confirmDelete});

  final void Function()? confirmDelete;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to remove this book from your cart?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: confirmDelete,
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
