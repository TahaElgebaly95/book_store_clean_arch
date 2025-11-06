import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/components/widgets/elevated_button.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../view_model/login_cubit/login_cubit.dart';
import '../../../view_model/login_cubit/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen:
          (previous, current) =>
              current is LoginLoading ||
              current is LoginSuccess ||
              current is LoginError,
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return CustomElevatedButton(
          nameOfButton: isLoading ? 'Loading...' : 'Login',
          backgroundColor: AppColors.primaryColor,
          onPressed: isLoading ? null : onPressed,
        );
      },
    );
  }
}
