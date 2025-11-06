import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/components/widgets/elevated_button.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/components/widgets/text_form_field_custom.dart';
import '../../../../../core/data/local/shared_helper.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/routing/routs.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../view_model/delete_account_cubit/delete_account_cubit.dart';
import '../../view_model/delete_account_cubit/delete_account_state.dart';
import 'profile_validators.dart';

class DangerZoneSection extends StatelessWidget {
  const DangerZoneSection({super.key});

  void _showDeleteDialog(BuildContext context) {
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool showPassword = false;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<DeleteAccountCubit>(),
          child: StatefulBuilder(
            builder: (context, setState) {
              return BlocBuilder<DeleteAccountCubit, DeleteAccountState>(
                builder: (context, state) {
                  final isLoading = state is DeleteAccountLoading;
                  return AlertDialog(
                    title: Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: AppColors.kRed,
                          size: 28.sp,
                        ),
                        SizedBox(width: 8.w),
                        TextCustom(
                          text: 'Delete Account',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kRed,
                        ),
                      ],
                    ),
                    content: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustom(
                            text:
                                'This action cannot be undone. All your data will be permanently deleted.',
                            fontSize: 14.sp,
                            color: AppColors.kBlack,
                          ),
                          SizedBox(height: 16.h),
                          CustomTextFormField(
                            controller: passwordController,
                            labelText: 'Current Password',
                            obscureText: !showPassword,
                            validator: ProfileValidators.validatePassword,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: AppColors.kRed,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                showPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.kGrey,
                              ),
                              onPressed:
                                  () => setState(
                                    () => showPassword = !showPassword,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed:
                            isLoading
                                ? null
                                : () => Navigator.pop(dialogContext),
                        child: TextCustom(
                          text: 'Cancel',
                          fontSize: 16.sp,
                          color: AppColors.kGrey,
                        ),
                      ),
                      ElevatedButton(
                        onPressed:
                            isLoading
                                ? null
                                : () {
                                  if (formKey.currentState!.validate()) {
                                    context
                                        .read<DeleteAccountCubit>()
                                        .deleteAccount(
                                      passwordController.text,
                                    );
                                  }
                                },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kRed,
                        ),
                        child:
                            isLoading
                                ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                                : TextCustom(
                                  text: 'Delete Account',
                                  fontSize: 16.sp,
                                  color: AppColors.kWhite,
                                ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state)  async {
        if (state is DeleteAccountSuccess)  {
          Functions.showToast('Account deleted successfully');
          await SharedHelper.clear();
          context.go(Routs.loginRoute);
        } else if (state is DeleteAccountError) {
          Functions.showToast(state.message);
        }
      },
      child: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.kRed.withAlpha(35),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.kRed.withAlpha(50), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.dangerous_outlined,
                  color: AppColors.kRed,
                  size: 24.sp,
                ),
                SizedBox(width: 8.w),
                TextCustom(
                  text: 'Danger Zone',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kRed,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            TextCustom(
              text:
                  'Deleting your account will permanently remove all your data. This action cannot be undone.',
              fontSize: 13.sp,
              color: AppColors.kBlack.withAlpha(90),
            ),
            SizedBox(height: 16.h),
            BlocBuilder<DeleteAccountCubit, DeleteAccountState>(
              builder: (context, state) {
                final loading = state is DeleteAccountLoading;
                return CustomElevatedButton(
                  nameOfButton: loading ? 'Deleting...' : 'Delete Account',
                  backgroundColor: AppColors.kRed,
                  onPressed: loading ? null : () => _showDeleteDialog(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
