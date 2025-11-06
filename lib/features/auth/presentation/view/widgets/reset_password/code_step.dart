import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/elevated_button.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../view_model/reset_password_cubit/reset_password_cubit.dart';
import '../../../view_model/reset_password_cubit/reset_password_state.dart';
import '../auth_text_field.dart';

class CodeStep extends StatefulWidget {
  const CodeStep({super.key});

  @override
  State<CodeStep> createState() => _CodeStepState();
}

class _CodeStepState extends State<CodeStep> {
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustom(
          text: 'Enter Code',
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        SizedBox(height: 8.h),
        TextCustom(
          text: 'Check your email for the verification code',
          fontSize: 14.sp,
          color: AppColors.kGrey,
        ),
        SizedBox(height: 32.h),
        AuthTextField(
          controller: _codeController,
          label: 'Code',
          hint: 'Enter verification code',
          prefixIcon: Icons.password_outlined,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 24.h),
        BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
          buildWhen: (previous, current) => current is ResetPasswordLoading,
          builder: (context, state) {
            final isLoading = state is ResetPasswordLoading;
            return CustomElevatedButton(
              nameOfButton: isLoading ? 'Verifying...' : 'Verify Code',
              backgroundColor: AppColors.primaryColor,
              onPressed: isLoading
                  ? null
                  : () => context
                  .read<ResetPasswordCubit>()
                  .verifyCode(_codeController.text),
            );
          },
        ),
      ],
    );
  }
}