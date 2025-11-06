import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/routing/routs.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => context.push(Routs.forgotPasswordRoute),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
