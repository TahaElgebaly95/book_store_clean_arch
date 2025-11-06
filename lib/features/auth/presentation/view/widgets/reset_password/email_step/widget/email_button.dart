import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/components/widgets/elevated_button.dart';
import '../../../../../../../../core/utils/colors.dart';
import '../../../../../view_model/reset_password_cubit/reset_password_cubit.dart';
import '../../../../../view_model/reset_password_cubit/reset_password_state.dart';

class EmailStepButton extends StatelessWidget {
  final TextEditingController emailController;

  const EmailStepButton({
    super.key,
    required this.emailController,
  });

  void _handleSendCode(BuildContext context) {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<ResetPasswordCubit>().sendLink(email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        final isLoading = state is ResetPasswordLoading;

        return CustomElevatedButton(
          nameOfButton: isLoading ? 'Sending...' : 'Send Code',
          backgroundColor: AppColors.primaryColor,
          onPressed: isLoading ? null : () => _handleSendCode(context),
        );
      },
    );
  }
}