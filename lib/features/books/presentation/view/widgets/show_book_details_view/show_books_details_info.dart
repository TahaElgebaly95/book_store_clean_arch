import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/model/all_products_books.dart';

class BookDetailsInfo extends StatelessWidget {
  final ProductModel product;

  const BookDetailsInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // اسم الكتاب
          Text(
            product.name,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.kBlack,
            ),
          ),

          SizedBox(height: 12.h),

          // الفئة والسعر
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // الفئة
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withAlpha(10),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  product.category,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // السعر
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (product.discount > 0) ...[
                    Text(
                      '${product.price} EGP',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.kGrey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(height: 4.h),
                  ],
                  Row(
                    children: [
                      Text(
                        '${product.priceAfterDiscount}',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'EGP',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // الخصم (إن وجد)
          if (product.discount > 0) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.red, width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.local_offer, color: Colors.red, size: 16.sp),
                  SizedBox(width: 6.w),
                  Text(
                    '${product.discount}% OFF',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
