import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/login_cubit/login_cubit.dart';
import '../../../view_model/login_cubit/login_state.dart';
import '../auth_text_field.dart';

class LoginEmailAndPassword extends StatelessWidget {
  const LoginEmailAndPassword({super.key, required this.emailController, required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          controller: emailController,
          label: 'Email',
          hint: 'Enter your email',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen:
              (previous, current) =>
          current is LoginPasswordVisibilityChanged,
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
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
      ],
    );
  }
}
