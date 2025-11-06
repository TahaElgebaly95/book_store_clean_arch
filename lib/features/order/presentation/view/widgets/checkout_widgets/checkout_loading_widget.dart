import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';

class CheckoutLoadingWidget extends StatelessWidget {
  const CheckoutLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}