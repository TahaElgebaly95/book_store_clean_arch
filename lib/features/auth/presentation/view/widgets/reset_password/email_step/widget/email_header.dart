import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../../../core/utils/colors.dart';

class EmailStepHeader extends StatelessWidget {
  const EmailStepHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustom(
          text: 'Reset Password',
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        SizedBox(height: 8.h),
        TextCustom(
          text: 'Enter your email to receive reset code',
          fontSize: 14.sp,
          color: AppColors.kGrey,
        ),
      ],
    );
  }
}