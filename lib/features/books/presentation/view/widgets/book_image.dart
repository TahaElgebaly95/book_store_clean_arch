import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../data/model/all_products_books.dart';

class BookImage extends StatelessWidget {
  final ProductModel product;

  const BookImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: NetworkImage(product.image ?? ''),
          fit: BoxFit.cover,
        ),
      ),
      child: product.discount > 0
          ? Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.all(6.w),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.kRed,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: TextCustom(
            text: '-${product.discount}%',
            color: AppColors.kWhite,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
          : null,
    );
  }
}