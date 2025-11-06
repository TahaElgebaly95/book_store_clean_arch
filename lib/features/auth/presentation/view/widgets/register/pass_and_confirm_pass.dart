import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/register_cubit/register_cubit.dart';
import '../auth_text_field.dart';

class PassAndConfirmPass extends StatelessWidget {
  const PassAndConfirmPass({super.key, required this.passwordController, required this.confirmPasswordController});

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (previous, current) =>
          current is RegisterPasswordVisibilityChanged,
          builder: (context, state) {
            final cubit = context.read<RegisterCubit>();
            return AuthTextField(
              controller: passwordController,
              label: 'Password',
              hint: 'Enter your password',
              prefixIcon: Icons.lock_outlined,
              obscureText: !cubit.isPasswordVisible,
              showSuffixIcon: true,
              onSuffixIconPressed: cubit.togglePasswordVisibility,
            );
          },
        ),
        SizedBox(height: 16.h),
        BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (previous, current) =>
          current is RegisterPasswordVisibilityChanged,
          builder: (context, state) {
            final cubit = context.read<RegisterCubit>();
            return AuthTextField(
              controller: confirmPasswordController,
              label: 'Confirm Password',
              hint: 'Re-enter your password',
              prefixIcon: Icons.lock_outlined,
              obscureText: !cubit.isConfirmPasswordVisible,
              showSuffixIcon: true,
              onSuffixIconPressed: cubit.toggleConfirmPasswordVisibility,
            );
          },
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
