// lib/features/home/presentation/view/widgets/category_products/category_products_grid.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../../../favourite/presentation/view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../../../../favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';
import '../../../../domain/entities/product_entity.dart';
import '../items/category_product_item.dart';

class CategoryProductsGrid extends StatelessWidget {
  final List<ProductEntity> products;

  const CategoryProductsGrid({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 80.sp,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16.h),
            Text(
              'No products found',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'This category is empty',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(16.sp),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.65,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return CategoryProductItem(
          product: product,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Product: ${product.name}')),
            );
          },
          onFavoriteTap: () {
            context.read<AddOrRemoveFavCubit>().addToFavourite(product.id);
            // Refresh favorites
            context.read<GetFavouriteCubit>().getFavourite();
          },
          onAddToCart: () {
            context.read<AddOrRemoveToCartCubit>().addToCart(
              productId: product.id,
            );
          },
        );
      },
    );
  }
}