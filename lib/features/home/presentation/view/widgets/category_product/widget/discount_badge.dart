// lib/features/home/presentation/view/widgets/category_product/widgets/discount_badge.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountBadge extends StatelessWidget {
  final int discount;

  const DiscountBadge({required this.discount, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 6.h,
      left: 6.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          '-$discount%',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}