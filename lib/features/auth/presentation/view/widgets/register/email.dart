import 'package:flutter/material.dart';
import '../auth_text_field.dart';

class Email extends StatelessWidget {
  const Email({super.key, required this.emailController});

  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: emailController,
      label: 'Email',
      hint: 'Enter your email',
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
