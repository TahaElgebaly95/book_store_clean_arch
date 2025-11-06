import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/components/widgets/elevated_button.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../view_model/register_cubit/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, this.onPressed});

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen:
          (previous, current) =>
      current is RegisterLoading ||
          current is RegisterSuccess ||
          current is RegisterError,
      builder: (context, state) {
        final isLoading = state is RegisterLoading;
        return CustomElevatedButton(
          nameOfButton: isLoading ? 'Loading...' : 'Register',
          backgroundColor: AppColors.primaryColor,
          onPressed: isLoading ? null : onPressed,
        );
      },
    );
  }
}
