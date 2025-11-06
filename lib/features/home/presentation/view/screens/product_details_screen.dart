
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../../favourite/presentation/view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../../../favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';
import '../../../domain/entities/product_entity.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          // ✅ Favorite Button in AppBar
          BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
            builder: (context, state) {
              bool isFavorite = false;
              if (state is GetFavouriteSuccessState) {
                isFavorite = state.favouriteModel.data!.dataFavItem!
                    .any((fav) => fav.id == product.id);
              }

              return IconButton(
                onPressed: () {
                  context.read<AddOrRemoveFavCubit>().addToFavourite(product.id);
                  context.read<GetFavouriteCubit>().getFavourite();
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey[700],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ==================== Product Image ====================
                  Stack(
                    children: [
                      Image.network(
                        product.imageUrl,
                        width: double.infinity,
                        height: 400.h,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 400.h,
                          color: Colors.grey[300],
                          child: const Icon(Icons.broken_image, size: 80),
                        ),
                      ),
                      if (product.hasDiscount)
                        Positioned(
                          top: 16.h,
                          left: 16.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              '-${product.discount}%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ==================== Product Name ====================
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: 8.h),

                        // ==================== Category ====================
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            product.category,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // ==================== Price ====================
                        Row(
                          children: [
                            if (product.hasDiscount)
                              Text(
                                'EGP ${product.price}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            if (product.hasDiscount) SizedBox(width: 8.w),
                            Text(
                              'EGP ${product.priceAfterDiscount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan[700],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),

                        // ==================== Stock Status ====================
                        Row(
                          children: [
                            Icon(
                              product.isInStock
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              color: product.isInStock ? Colors.green : Colors.red,
                              size: 20.sp,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              product.isInStock ? 'In Stock' : 'Out of Stock',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: product.isInStock
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),

                        // ==================== Description ====================
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                            height: 1.6,
                          ),
                        ),
                        SizedBox(height: 80.h), // Space for bottom button
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ==================== Add to Cart Button (Fixed at bottom) ====================
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton.icon(
                  onPressed: product.isInStock
                      ? () {
                    context.read<AddOrRemoveToCartCubit>().addToCart(
                      productId: product.id,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.name} added to cart'),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                      : null,
                  icon: const Icon(Icons.shopping_cart),
                  label: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}