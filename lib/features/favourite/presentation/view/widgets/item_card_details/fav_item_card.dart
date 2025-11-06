import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/model/fav_model.dart';
import 'add_to_cart_button.dart';
import 'delete_button.dart';
import 'product_image_card.dart';

class FavItemCard extends StatelessWidget {
  final FavouriteItem item;

  const FavItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // صورة المنتج
          ProductImageCard(item: item),
          SizedBox(width: 12.w),

          // تفاصيل المنتج
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم المنتج
                Text(
                  item.name ?? 'Product Name',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),

                // السعر
                Text(
                  '${item.price?.toStringAsFixed(2) ?? '0.00'} EGP',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),

          // أزرار (حذف + إضافة للسلة)
          Column(
            children: [
              DeleteButton(item: item),
              SizedBox(height: 10.h),
              AddToCartButton(item: item),
            ],
          ),
        ],
      ),
    );
  }
}