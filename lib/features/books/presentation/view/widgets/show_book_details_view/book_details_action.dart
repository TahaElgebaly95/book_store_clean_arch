import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../../../cart/presentation/view_model/fetch_cart_cubit/fetch_cart_cubit.dart';
import '../../../../data/model/all_products_books.dart';

class BookDetailsActions extends StatelessWidget {
  final ProductModel product;

  const BookDetailsActions({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        child: BlocBuilder<FetchCartCubit, FetchCartState>(
          builder: (context, cartState) {
            return BlocBuilder<AddOrRemoveToCartCubit, AddOrRemoveToCartState>(
              builder: (context, addCartState) {
                final cartCubit = context.read<FetchCartCubit>();
                final addCartCubit = context.read<AddOrRemoveToCartCubit>();

                final isInCart = cartCubit.isProductInCart(product.id);
                final isLoading = addCartCubit.isProductLoading(product.id);

                return _buildCartButton(
                  context,
                  isInCart: isInCart,
                  isLoading: isLoading,
                  onPressed: () {
                    if (isInCart) {
                      final cartItemId = cartCubit.getCartItemId(product.id);
                      if (cartItemId != null) {
                        addCartCubit.removeFromCart(cartItemId: cartItemId);
                      }
                    } else {
                      addCartCubit.addToCart(productId: product.id);
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildCartButton(
      BuildContext context, {
        required bool isInCart,
        required bool isLoading,
        required VoidCallback onPressed,
      }) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isInCart ? Colors.orange : AppColors.primaryColor,
          disabledBackgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
          width: 24.sp,
          height: 24.sp,
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isInCart ? Icons.shopping_cart : Icons.add_shopping_cart,
              size: 24.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              isInCart ? 'Remove from Cart' : 'Add to Cart',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}