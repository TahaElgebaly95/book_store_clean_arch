import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../../cart/presentation/view_model/fetch_cart_cubit/fetch_cart_cubit.dart';
import '../../../../favourite/presentation/view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../../../favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';
import '../../../data/model/all_products_books.dart';

class BookActions extends StatelessWidget {
  final ProductModel product;

  const BookActions({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [_buildFavouriteButton(context), _buildCartButton(context)],
    );
  }

  Widget _buildFavouriteButton(BuildContext context) {
    return BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
      builder: (context, favState) {
        return BlocBuilder<AddOrRemoveFavCubit, AddOrRemoveFavState>(
          builder: (context, addFavState) {
            final favCubit = context.read<GetFavouriteCubit>();
            final addFavCubit = context.read<AddOrRemoveFavCubit>();

            final isInFavourite = favCubit.isProductFavourite(product.id);
            final isLoading =
                addFavState is AddToFavLoadingState ||
                addFavState is RemoveFavLoadingState;

            return InkWell(
              onTap:
                  isLoading
                      ? null
                      : () {
                        if (isInFavourite) {
                          addFavCubit.removeFavProduct(product.id);
                        } else {
                          addFavCubit.addToFavourite(product.id);
                        }
                      },
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: isInFavourite ? Colors.red[50] : Colors.grey[100],
                  border: Border.all(
                    color: isInFavourite ? Colors.red : Colors.grey,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child:
                    isLoading
                        ? SizedBox(
                          width: 20.sp,
                          height: 20.sp,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                        : Icon(
                          isInFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isInFavourite ? Colors.red : Colors.grey,
                          size: 20.sp,
                        ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCartButton(BuildContext context) {
    return BlocBuilder<FetchCartCubit, FetchCartState>(
      builder: (context, cartState) {
        return BlocBuilder<AddOrRemoveToCartCubit, AddOrRemoveToCartState>(
          builder: (context, addCartState) {
            final cartCubit = context.read<FetchCartCubit>();
            final addCartCubit = context.read<AddOrRemoveToCartCubit>();

            final isInCart = cartCubit.isProductInCart(product.id);
            final isLoading = addCartCubit.isProductLoading(product.id);

            return InkWell(
              onTap:
                  isLoading
                      ? null
                      : () {
                        if (isInCart) {
                          final cartItemId = cartCubit.getCartItemId(
                            product.id,
                          );
                          if (cartItemId != null) {
                            addCartCubit.removeFromCart(cartItemId: cartItemId);
                          }
                        } else {
                          addCartCubit.addToCart(productId: product.id);
                        }
                      },
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: isInCart ? Colors.orange[50] : Colors.green[50],
                  border: Border.all(
                    color: isInCart ? Colors.orange : Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child:
                    isLoading
                        ? SizedBox(
                          width: 20.sp,
                          height: 20.sp,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                        : Icon(
                          isInCart
                              ? Icons.shopping_cart
                              : Icons.add_shopping_cart,
                          color: isInCart ? Colors.orange : Colors.green,
                          size: 20.sp,
                        ),
              ),
            );
          },
        );
      },
    );
  }
}
