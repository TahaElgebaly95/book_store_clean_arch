import 'package:flutter/material.dart';
import '../auth_text_field.dart';

class Name extends StatelessWidget {
  const Name({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: nameController,
      label: 'Name',
      hint: 'Enter your name',
      prefixIcon: Icons.person_outlined,
    );
  }
}
