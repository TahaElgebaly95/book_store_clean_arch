import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/place_order_cubit/place_order_cubit.dart';
import 'checkout_message_type.dart';

class CheckoutListeners extends StatelessWidget {
  final Widget child;

  const CheckoutListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaceOrderCubit, PlaceOrderState>(
      listener: _handlePlaceOrder,
      child: child,
    );
  }
}

void _handlePlaceOrder(BuildContext context, PlaceOrderState state) {
  if (state is PlaceOrderSuccessState) {
    _showMessage(
      context,
      'Order placed successfully! 🎉',
      CheckoutMessageType.success,
    );
    // Navigate to order history or order details
    Navigator.pop(context);
  } else if (state is PlaceOrderErrorState) {
    _showMessage(context, state.error, CheckoutMessageType.error);
  }
}

void _showMessage(
    BuildContext context,
    String message,
    CheckoutMessageType type,
    ) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: type.color,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ),
  );
}