import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';

class CartErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const CartErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80.sp,
            color: Colors.red,
          ),
          SizedBox(height: 20.h),
          TextCustom(
            text: message,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
          SizedBox(height: 20.h),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
            ),
          ),
        ],
      ),
    );
  }
}