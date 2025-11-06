import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';

class OrderLoadingState extends StatelessWidget {
  const OrderLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}