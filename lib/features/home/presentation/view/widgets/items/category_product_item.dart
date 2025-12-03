import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/entities/product_entity.dart';
import '../category_product/widget/product_image_section.dart';
import '../category_product/widget/product_info_section.dart';

class CategoryProductItem extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onAddToCart;

  const CategoryProductItem({
    required this.product,
    required this.onTap,
    required this.onFavoriteTap,
    required this.onAddToCart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProductImageSection(
              product: product,
              onFavoriteTap: onFavoriteTap,
            ),
            ProductInfoSection(
              product: product,
              onAddToCart: onAddToCart,
            ),
          ],
        ),
      ),
    );
  }
}