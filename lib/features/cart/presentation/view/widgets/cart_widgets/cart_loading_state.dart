import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';

class CartLoadingState extends StatelessWidget {
  const CartLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}