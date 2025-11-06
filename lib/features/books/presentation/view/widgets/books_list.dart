import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/model/all_products_books.dart';
import 'book_card.dart';

class BooksList extends StatelessWidget {
  final List<ProductModel> products;

  const BooksList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.w),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return BookCard(product: products[index]);
      },
    );
  }
}