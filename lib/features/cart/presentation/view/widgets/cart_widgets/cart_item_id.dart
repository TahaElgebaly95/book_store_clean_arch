import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../view_model/update_cart_cubit/update_cart_cubit.dart';
import 'delete_dialog.dart';
import 'cart_item_details.dart';
import 'cart_item_image.dart';

class CartItemCard extends StatefulWidget {
  final dynamic item;

  const CartItemCard({super.key, required this.item});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.item.itemQuantity ?? 1;
  }

  void _updateQuantity(int newQuantity) {
    if (newQuantity < 1) return;

    final maxStock = widget.item.itemProductStock ?? 10;
    if (newQuantity > maxStock) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Maximum stock is $maxStock'),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      quantity = newQuantity;
    });

    context.read<UpdateCartCubit>().updateCart(
      cartItemId: widget.item.itemId ?? 0,
      quantity: newQuantity,
    );
  }

  void _confirmDelete() {
    if (widget.item.itemId != null) {
      showDialog(
        context: context,
        builder:
            (context) => ConfirmDelete(
              confirmDelete: () {
                _deleteItem();
              },
            ),
      );
    }
  }

  void _deleteItem() {
    if (widget.item.itemId != null) {
      context.read<AddOrRemoveToCartCubit>().removeFromCart(
        cartItemId: widget.item.itemId!,
      );
      if (context.read<AddOrRemoveToCartCubit>().state
          is RemoveFromCartSuccessState) {
      }
        Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.all(10.sp),
      height: 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kGrey, width: 2),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المنتج
          CartItemImage(imageUrl: widget.item.itemProductImage),

          SizedBox(width: 10.w),

          // تفاصيل المنتج
          Expanded(
            child: CartItemDetails(
              item: widget.item,
              quantity: quantity,
              onIncrement: () => _updateQuantity(quantity + 1),
              onDecrement: () => _updateQuantity(quantity - 1),
              onDelete: _confirmDelete,
            ),
          ),
        ],
      ),
    );
  }
}
