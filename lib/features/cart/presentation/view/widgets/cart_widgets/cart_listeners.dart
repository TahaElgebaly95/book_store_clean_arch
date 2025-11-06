import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../view_model/fetch_cart_cubit/fetch_cart_cubit.dart';
import '../../../view_model/update_cart_cubit/update_cart_cubit.dart';
import 'cart_message_type.dart';

class CartListeners extends StatelessWidget {
  final Widget child;

  const CartListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddOrRemoveToCartCubit, AddOrRemoveToCartState>(
          listener: _handleCartOperations,
        ),
        BlocListener<UpdateCartCubit, UpdateCartState>(
          listener: _handleCartUpdate,
        ),
      ],
      child: child,
    );
  }

  void _handleCartOperations(BuildContext context, AddOrRemoveToCartState state) {
    switch (state) {
      case AddToCartSuccessState():
        _refreshCart(context);
        _showMessage(context, 'Added to cart successfully', CartMessageType.success);
      case RemoveFromCartSuccessState():
        _refreshCart(context);
        _showMessage(context, 'Removed from cart', CartMessageType.warning);
      case AddToCartErrorState():
        _showMessage(context, state.message, CartMessageType.error);
      case RemoveFromCartErrorState():
        _showMessage(context, state.message, CartMessageType.error);
      default:
        break;
    }
  }

  void _handleCartUpdate(BuildContext context, UpdateCartState state) {
    if (state is UpdateCartSuccessState) {
      _refreshCart(context);
      _showMessage(context, 'Quantity updated', CartMessageType.info);
    } else if (state is UpdateCartErrorState) {
      _showMessage(context, state.errorMessage, CartMessageType.error);
    }
  }

  void _refreshCart(BuildContext context) {
    context.read<FetchCartCubit>().fetchCart();
  }

  void _showMessage(BuildContext context, String message, CartMessageType type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: type.color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}