import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/model/all_products_books.dart';

class BookDetailsDescription extends StatelessWidget {
  final ProductModel product;

  const BookDetailsDescription({super.key, required this.product});

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
          Row(
            children: [
              Icon(
                Icons.description_outlined,
                color: AppColors.primaryColor,
                size: 24.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kBlack,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Text(
            product.description,
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.kGrey,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}