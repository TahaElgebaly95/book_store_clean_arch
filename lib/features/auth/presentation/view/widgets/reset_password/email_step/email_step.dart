import 'package:book_store_mvvm/features/auth/presentation/view/widgets/reset_password/email_step/widget/email_button.dart';
import 'package:book_store_mvvm/features/auth/presentation/view/widgets/reset_password/email_step/widget/email_error.dart';
import 'package:book_store_mvvm/features/auth/presentation/view/widgets/reset_password/email_step/widget/email_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../auth_text_field.dart';


class EmailStep extends StatefulWidget {
  const EmailStep({super.key});

  @override
  State<EmailStep> createState() => _EmailStepState();
}

class _EmailStepState extends State<EmailStep> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const EmailStepHeader(),
        SizedBox(height: 32.h),
        AuthTextField(
          controller: _emailController,
          label: 'Email',
          hint: 'Enter your email',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 24.h),
        const EmailStepError(),
        EmailStepButton(emailController: _emailController),
      ],
    );
  }
}