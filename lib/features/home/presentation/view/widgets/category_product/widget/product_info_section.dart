// lib/features/home/presentation/view/widgets/category_product/widgets/product_info_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../domain/entities/product_entity.dart';
import 'add_to_cart_button.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onAddToCart;

  const ProductInfoSection({
    required this.product,
    required this.onAddToCart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProductName(),
          SizedBox(height: 3.h),
          _buildPriceSection(),
          SizedBox(height: 8.h),
          AddToCartButton(
            isInStock: product.isInStock,
            onPressed: onAddToCart,
          ),
        ],
      ),
    );
  }

  Widget _buildProductName() {
    return Text(
      product.name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: Colors.black,
      ),
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (product.hasDiscount)
          Text(
            'EGP ${product.price}',
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        Text(
          'EGP ${product.priceAfterDiscount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: Colors.cyan[700],
          ),
        ),
      ],
    );
  }
}