
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/product_entity.dart';
import '../common/section_header.dart';
import '../items/product_item.dart';

class BestSellersSection extends StatelessWidget {
  final List<ProductEntity> products;

  const BestSellersSection({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Best Seller'),
        SizedBox(height: 12.h),
        SizedBox(
          height: 280.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              return ProductItem(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}