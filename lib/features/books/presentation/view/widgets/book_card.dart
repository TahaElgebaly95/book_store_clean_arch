import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/routing/routs.dart';
import '../../../data/model/all_products_books.dart';
import 'book_actions.dart';
import 'book_image.dart';
import 'books_details.dart';

class BookCard extends StatelessWidget {
  final ProductModel product;

  const BookCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(Routs.showBookDetailsRoute, extra: product),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        height: 160.h,
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
            // صورة الكتاب + الخصم
            BookImage(product: product),

            SizedBox(width: 12.w),

            // تفاصيل الكتاب
            Expanded(
              child: BookDetails(product: product),
            ),

            SizedBox(width: 8.w),

            // أزرار الإجراءات
            BookActions(product: product),
          ],
        ),
      ),
    );
  }
}