import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 120.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20.h),
          TextCustom(
            text: 'Your Cart is Empty',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
          SizedBox(height: 10.h),
          TextCustom(
            text: 'Start adding books to your cart',
            fontSize: 16.sp,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }
}