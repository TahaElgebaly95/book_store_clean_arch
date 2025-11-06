import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';

class CartQuantityControls extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartQuantityControls({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // زر النقص
          InkWell(
            onTap: quantity > 1 ? onDecrement : null,
            child: Container(
              padding: EdgeInsets.all(6.w),
              child: Icon(
                Icons.remove,
                size: 16.sp,
                color: quantity > 1 ? AppColors.kBlack : AppColors.kGrey,
              ),
            ),
          ),

          // عرض الكمية
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            constraints: BoxConstraints(minWidth: 30.w),
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.kBlack,
              ),
            ),
          ),

          // زر الزيادة
          InkWell(
            onTap: onIncrement,
            child: Container(
              padding: EdgeInsets.all(6.w),
              child: Icon(
                Icons.add,
                size: 16.sp,
                color: AppColors.kBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}