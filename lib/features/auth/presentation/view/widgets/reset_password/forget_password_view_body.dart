import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/routing/routs.dart';
import '../../../../../../core/utils/show_toast.dart';

import '../../../view_model/reset_password_cubit/reset_password_cubit.dart';
import '../../../view_model/reset_password_cubit/reset_password_state.dart';
import 'code_step.dart';
import 'email_step/email_step.dart';
import 'password_step.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordError) {
          Functions.showToast(state.message);
        } else if (state is ResetPasswordLinkSent) {
          Functions.showToast('Code sent to your email!');
        } else if (state is ResetPasswordCodeVerified) {
          Functions.showToast('Code verified!');
        } else if (state is ResetPasswordResetSuccess) {
          Functions.showToast('Password reset successful!');
          context.go(Routs.loginRoute);
        }
      },
      child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
          final linkSent = state is ResetPasswordLinkSent;
          final codeVerified = state is ResetPasswordCodeVerified;

          return SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!linkSent && !codeVerified)
                  const EmailStep()
                else if (linkSent && !codeVerified)
                  const CodeStep()
                else if (codeVerified)
                  const PasswordStep(),
              ],
            ),
          );
        },
      ),
    );
  }
}
