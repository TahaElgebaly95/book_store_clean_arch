import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';
import 'cart_quantity_controls.dart';

class CartItemDetails extends StatelessWidget {
  final dynamic item;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const CartItemDetails({
    super.key,
    required this.item,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // اسم المنتج
        Text(
          item.itemProductName ?? 'Product Name',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        SizedBox(height: 6.h),

        // السعر والخصم
        Wrap(
          spacing: 6.w,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (item.itemProductDiscount != null &&
                item.itemProductDiscount! > 0)
              Text(
                '${item.itemProductPrice} EGP',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[500],
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            Text(
              '${item.itemProductPriceAfterDiscount ?? item.itemProductPrice} EGP',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),

        SizedBox(height: 8.h),

        // الكمية وزر الحذف
        Row(
          children: [
            // أزرار التحكم بالكمية
            CartQuantityControls(
              quantity: quantity,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),

            const Spacer(),

            // زر الحذف
            InkWell(
              onTap: onDelete,
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.delete_outline,
                  color: AppColors.kRed,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),

        // إجمالي السعر
        if (item.itemTotal != null) ...[
          SizedBox(height: 6.h),
          Text(
            'Total: ${item.itemTotal} EGP',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
          ),
        ],
      ],
    );
  }
}