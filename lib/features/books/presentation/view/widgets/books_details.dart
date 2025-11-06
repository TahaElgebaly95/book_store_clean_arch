import 'package:book_store_mvvm/core/components/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../data/model/all_products_books.dart';

class BookDetails extends StatelessWidget {
  final ProductModel product;

  const BookDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // اسم الكتاب
        Text(
          product.name,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        // الفئة
        Text(
          product.category,
          style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
        ),

        // السعر
        if (product.discount > 0) ...[
          TextCustom(
            text: '${product.price} EGP',
            fontSize: 13.sp,
            color: Colors.grey[500],
            decoration: TextDecoration.lineThrough,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        TextCustom(
          text: '${product.priceAfterDiscount } EGP',
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
