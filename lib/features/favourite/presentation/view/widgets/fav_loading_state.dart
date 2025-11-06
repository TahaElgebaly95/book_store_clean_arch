import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';

class FavLoadingState extends StatelessWidget {
  const FavLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}