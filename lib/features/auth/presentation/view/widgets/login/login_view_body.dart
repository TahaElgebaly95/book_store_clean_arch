import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/routing/routs.dart';
import '../../../../../../core/utils/show_toast.dart';
import '../../../view_model/login_cubit/login_cubit.dart';
import '../../../view_model/login_cubit/login_state.dart';
import 'login_form.dart';
import 'login_header.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          Functions.showToast(state.message);
        } else if (state is LoginSuccess) {
          Functions.showToast('Login successful!');
          context.go(Routs.bottomNavBarRoute);
        }
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            const LoginHeader(),
            SizedBox(height: 40.h),
            const LoginForm(),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 16.sp, color: AppColors.kGrey),
                ),
                TextButton(
                  onPressed: () => context.pushReplacement(Routs.registerRoute),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}