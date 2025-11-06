import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/routing/routs.dart';

class ChangePasswordTextButton extends StatelessWidget {
  const ChangePasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.push(Routs.changePasswordRoute);
      },
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withAlpha(100),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: TextCustom(
          text: 'Change Password',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
