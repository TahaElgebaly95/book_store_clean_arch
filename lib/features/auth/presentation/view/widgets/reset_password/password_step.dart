import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/elevated_button.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';

import '../../../view_model/reset_password_cubit/reset_password_cubit.dart';
import '../../../view_model/reset_password_cubit/reset_password_state.dart';
import '../auth_text_field.dart';

class PasswordStep extends StatefulWidget {
  const PasswordStep({super.key});

  @override
  State<PasswordStep> createState() => _PasswordStepState();
}

class _PasswordStepState extends State<PasswordStep> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustom(
          text: 'New Password',
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        SizedBox(height: 8.h),
        TextCustom(
          text: 'Enter your new password',
          fontSize: 14.sp,
          color: AppColors.kGrey,
        ),
        SizedBox(height: 32.h),
        BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
          buildWhen: (previous, current) =>
          current is ResetPasswordVisibilityChanged,
          builder: (context, state) {
            final cubit = context.read<ResetPasswordCubit>();
            return AuthTextField(
              controller: _newPasswordController,
              label: 'New Password',
              hint: 'Enter new password',
              prefixIcon: Icons.lock_outlined,
              obscureText: !cubit.isPasswordVisible,
              showSuffixIcon: true,
              onSuffixIconPressed: cubit.togglePasswordVisibility,
            );
          },
        ),
        SizedBox(height: 16.h),
        BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
          buildWhen: (previous, current) =>
          current is ResetPasswordVisibilityChanged,
          builder: (context, state) {
            final cubit = context.read<ResetPasswordCubit>();
            return AuthTextField(
              controller: _confirmPasswordController,
              label: 'Confirm Password',
              hint: 'Re-enter new password',
              prefixIcon: Icons.lock_outlined,
              obscureText: !cubit.isPasswordVisible,
              showSuffixIcon: true,
              onSuffixIconPressed: cubit.togglePasswordVisibility,
            );
          },
        ),
        SizedBox(height: 24.h),
        BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
          buildWhen: (previous, current) => current is ResetPasswordLoading,
          builder: (context, state) {
            final isLoading = state is ResetPasswordLoading;
            return CustomElevatedButton(
              nameOfButton: isLoading ? 'Resetting...' : 'Reset Password',
              backgroundColor: AppColors.primaryColor,
              onPressed: isLoading
                  ? null
                  : () => context.read<ResetPasswordCubit>().resetPassword(
                password: _newPasswordController.text,
                confirmPassword: _confirmPasswordController.text,
              ),
            );
          },
        ),
      ],
    );
  }
}