import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../../../cart/presentation/view_model/fetch_cart_cubit/fetch_cart_cubit.dart';
import '../../../../data/model/fav_model.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.item});

  final FavouriteItem item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCartCubit, FetchCartState>(
      builder: (context, cartState) {
        return BlocBuilder<AddOrRemoveToCartCubit, AddOrRemoveToCartState>(
          builder: (context, addCartState) {
            final addCartCubit = context.read<AddOrRemoveToCartCubit>();
            final cartCubit = context.read<FetchCartCubit>();

            final isLoading = addCartCubit.isProductLoading(item.id ?? 0);
            final isInCart = cartCubit.isProductInCart(item.id ?? 0);

            return InkWell(
              onTap: isLoading
                  ? null
                  : () => isInCart
                  ? _showRemoveFromCartDialog(context, cartCubit)
                  : _showAddToCartDialog(context),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: isLoading
                      ? Colors.grey[200]
                      : isInCart
                      ? Colors.orange[50]
                      : Colors.green[50],
                  border: Border.all(
                    color: isInCart ? Colors.orange : Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: isLoading
                    ? SizedBox(
                  width: 24.sp,
                  height: 24.sp,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                )
                    : Icon(
                  isInCart ? Icons.shopping_cart : Icons.add_shopping_cart,
                  color: isInCart ? Colors.orange : Colors.green,
                  size: 24.sp,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showAddToCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add To Cart'),
        content: const Text(
          'Are you sure you want to add this item to your cart?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              if (item.id != null) {
                context
                    .read<AddOrRemoveToCartCubit>()
                    .addToCart(productId: item.id!);
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  void _showRemoveFromCartDialog(BuildContext context, FetchCartCubit cartCubit) {
    final cartItemId = cartCubit.getCartItemId(item.id ?? 0);

    if (cartItemId == null) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Remove From Cart'),
        content: const Text(
          'This item is already in your cart. Do you want to remove it?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context
                  .read<AddOrRemoveToCartCubit>()
                  .removeFromCart(cartItemId: cartItemId);
            },
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}