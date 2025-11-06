import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_custom.dart';

class FaqEmptyState extends StatelessWidget {
  const FaqEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.help_outline,
            size: 100.sp,
            color: Colors.grey[300],
          ),
          SizedBox(height: 24.h),
          TextCustom(
            text: 'No FAQs Found',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
          SizedBox(height: 8.h),
          TextCustom(
            text: 'Try adjusting your search',
            fontSize: 14.sp,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }
}