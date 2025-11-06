import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/components/widgets/elevated_button.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/components/widgets/text_form_field_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/show_toast.dart';
import '../../../view_model/change_password_cubit/change_password_cubit.dart';
import '../../../view_model/change_password_cubit/change_password_state.dart';
import '../profile_validators.dart';


class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(3, (_) => TextEditingController());
  final _visibility = List.generate(3, (_) => false);

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      context.read<ChangePasswordCubit>().changePassword(
        currentPassword: _controllers[0].text,
        newPassword: _controllers[1].text,
        newPasswordConfirmation: _controllers[2].text,
      );
    }
  }

  String? _validateConfirm(String? value) {
    if (value?.isEmpty ?? true) return 'Confirmation is required';
    if (value != _controllers[1].text) return 'Passwords do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          Functions.showToast('Password changed successfully');
          for (var c in _controllers) {
            c.clear();
          }
          context.pop();
        } else if (state is ChangePasswordError) {
          Functions.showToast(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextCustom(text: 'Change Password', fontSize: 20.sp, fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                _buildPasswordField(0, 'Current Password', ProfileValidators.validatePassword),
                SizedBox(height: 16.h),
                _buildPasswordField(1, 'New Password', ProfileValidators.validatePassword),
                SizedBox(height: 16.h),
                _buildPasswordField(2, 'Confirm New Password', _validateConfirm),
                SizedBox(height: 32.h),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(int index, String label, String? Function(String?)? validator) {
    return CustomTextFormField(
      controller: _controllers[index],
      labelText: label,
      obscureText: !_visibility[index],
      validator: validator,
      prefixIcon: Icon(Icons.lock_outline, color: AppColors.primaryColor),
      suffixIcon: IconButton(
        icon: Icon(
          _visibility[index] ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: AppColors.kGrey,
        ),
        onPressed: () => setState(() => _visibility[index] = !_visibility[index]),
      ),
    );
  }

  Widget _buildButton() {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      builder: (context, state) {
        final loading = state is ChangePasswordLoading;
        return SizedBox(
          width: double.infinity,
          child: CustomElevatedButton(
            nameOfButton: loading ? 'Changing...' : 'Change Password',
            backgroundColor: AppColors.primaryColor,
            onPressed: loading ? null : _changePassword,
          ),
        );
      },
    );
  }
}