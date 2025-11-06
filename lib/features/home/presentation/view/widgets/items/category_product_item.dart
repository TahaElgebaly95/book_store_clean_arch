// lib/features/home/presentation/view/widgets/category_products/category_product_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';
import '../../../../domain/entities/product_entity.dart';

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
          children: [
            _buildImageSection(),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),

                    const Spacer(),

                    // Price Section
                    _buildPriceSection(),

                    SizedBox(height: 6.h),

                    // Add to Cart Button
                    _buildAddToCartButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== Image Section ====================
  Widget _buildImageSection() {
    return Stack(
      children: [
        // Product Image
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
          child: Image.network(
            product.imageUrl,
            height: 140.h,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 140.h,
                color: Colors.grey[200],
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
            errorBuilder: (_, __, ___) => Container(
              height: 140.h,
              color: Colors.grey[200],
              child: Icon(
                Icons.broken_image_rounded,
                size: 48.sp,
                color: Colors.grey[400],
              ),
            ),
          ),
        ),

        // Discount Badge
        if (product.hasDiscount) _buildDiscountBadge(),

        // Favorite Button
        _buildFavoriteButton(),

        // Out of Stock Overlay
        if (!product.isInStock) _buildOutOfStockOverlay(),
      ],
    );
  }

  // ==================== Discount Badge ====================
  Widget _buildDiscountBadge() {
    return Positioned(
      top: 8.h,
      left: 8.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Text(
          '-${product.discount}%',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // ==================== Favorite Button ====================
  Widget _buildFavoriteButton() {
    return Positioned(
      top: 8.h,
      right: 8.w,
      child: BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
        builder: (context, favState) {
          bool isFavorite = false;

          if (favState is GetFavouriteSuccessState) {
            isFavorite = favState.favouriteModel.data!.dataFavItem!.any(
                  (fav) => fav.id == product.id,
            );
          }

          return GestureDetector(
            onTap: onFavoriteTap,
            child: Container(
              padding: EdgeInsets.all(6.sp),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey[700],
                size: 18.sp,
              ),
            ),
          );
        },
      ),
    );
  }

  // ==================== Out of Stock Overlay ====================
  Widget _buildOutOfStockOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              'OUT OF STOCK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==================== Price Section ====================
  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.hasDiscount)
          Text(
            'EGP ${product.price}',
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        Text(
          'EGP ${product.priceAfterDiscount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.cyan[700],
          ),
        ),
      ],
    );
  }

  // ==================== Add to Cart Button ====================
  Widget _buildAddToCartButton() {
    return SizedBox(
      width: double.infinity,
      height: 32.h,
      child: ElevatedButton(
        onPressed: product.isInStock ? onAddToCart : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey[300],
          disabledForegroundColor: Colors.grey[600],
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 15.sp),
            SizedBox(width: 4.w),
            Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}