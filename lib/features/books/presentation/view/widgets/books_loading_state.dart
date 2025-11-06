import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';

class BooksLoadingState extends StatelessWidget {
  const BooksLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}