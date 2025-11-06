import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';

class OrderEmptyState extends StatelessWidget {
  final String title;
  final String message;

  const OrderEmptyState({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 100.sp,
            color: Colors.grey[300],
          ),
          SizedBox(height: 24.h),
          TextCustom(
            text: title,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
          SizedBox(height: 8.h),
          TextCustom(
            text: message,
            fontSize: 14.sp,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }
}