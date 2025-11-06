import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/model/all_products_books.dart';
import 'book_details_action.dart';
import 'book_details_image.dart';
import 'book_details_listeners.dart';
import 'show_books_description.dart';
import 'show_books_details_info.dart';

class ShowProductDetailsView extends StatelessWidget {
  const ShowProductDetailsView({
    super.key,
    required this.products,
  });

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return BookDetailsListeners(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: AppColors.kBlack),
          title: Text(
            products.name,
            style: TextStyle(
              color: AppColors.kBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BookDetailsImage(product: products),
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        children: [
                          BookDetailsInfo(product: products),
                          SizedBox(height: 20.h),
                          BookDetailsDescription(product: products),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BookDetailsActions(product: products),
          ],
        ),
      ),
    );
  }
}