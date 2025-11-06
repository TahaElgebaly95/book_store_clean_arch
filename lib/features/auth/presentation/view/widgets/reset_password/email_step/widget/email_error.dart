import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../view_model/reset_password_cubit/reset_password_cubit.dart';
import '../../../../../view_model/reset_password_cubit/reset_password_state.dart';

class EmailStepError extends StatelessWidget {
  const EmailStepError({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        if (state is ResetPasswordError) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextCustom(
                      text: state.message,
                      fontSize: 12.sp,
                      color: Colors.red.shade700,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}