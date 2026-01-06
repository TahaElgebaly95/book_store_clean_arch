import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../domain/entities/product_entity.dart';
import 'discount_badge.dart';
import 'favorite_button.dart';

class ProductImageSection extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onFavoriteTap;

  const ProductImageSection({
    required this.product,
    required this.onFavoriteTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImage(),
        if (product.hasDiscount) DiscountBadge(discount: product.discount),
        FavoriteButton(productId: product.id, onTap: onFavoriteTap),
        if (!product.isInStock) _buildOutOfStockOverlay(),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      child: Image.network(
        product.imageUrl,
        height: 130.h,
        width: double.infinity,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 130.h,
            color: Colors.grey[200],
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (_, __, ___) => Container(
          height: 130.h,
          color: Colors.grey[200],
          child: Icon(
            Icons.broken_image_rounded,
            size: 40.sp,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }

  Widget _buildOutOfStockOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(500),
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              'OUT OF STOCK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}