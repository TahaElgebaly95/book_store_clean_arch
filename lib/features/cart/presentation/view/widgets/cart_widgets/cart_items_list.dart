import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart_header.dart';
import 'cart_item_id.dart';
import 'checkout_section.dart';

class CartItemsList extends StatelessWidget {
  final List cartItems;

  const CartItemsList({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartHeader(itemCount: cartItems.length),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                SizedBox(height: 10.h),
            padding: EdgeInsets.all(10.w),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return CartItemCard(item: cartItems[index]);
            },
          ),
        ),
        const CheckoutSection(),
        SizedBox(height: 10.h),
      ],
    );
  }
}