import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/routing/routs.dart';
import '../../../../../../core/utils/show_toast.dart';
import '../../../view_model/register_cubit/register_cubit.dart';
import 'register_form.dart';
import 'register_header.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          Functions.showToast(state.message);
        } else if (state is RegisterSuccess) {
          Functions.showToast('Registration successful!');
          context.go(Routs.loginRoute);
        }
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            const RegisterHeader(),
            SizedBox(height: 40.h),
            const RegisterForm(),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 16.sp, color: AppColors.kGrey),
                ),
                TextButton(
                  onPressed: () => context.pushReplacement(Routs.loginRoute),
                  child: Text(
                    'Login',
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