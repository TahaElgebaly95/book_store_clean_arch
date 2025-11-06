import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/fetch_cart_cubit/fetch_cart_cubit.dart';
import 'cart_widgets/cart_empty_state.dart';
import 'cart_widgets/cart_error_state.dart';
import 'cart_widgets/cart_items_list.dart';
import 'cart_widgets/cart_listeners.dart';
import 'cart_widgets/cart_loading_state.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    super.initState();
    _fetchCart();
  }

  void _fetchCart() => context.read<FetchCartCubit>().fetchCart();

  @override
  Widget build(BuildContext context) {
    return CartListeners(
      child: BlocBuilder<FetchCartCubit, FetchCartState>(
        builder: (context, state) => _buildCartState(state),
      ),
    );
  }

  Widget _buildCartState(FetchCartState state) {
    return switch (state) {
      FetchCartLoadingState() => const CartLoadingState(),
      FetchCartErrorState() => CartErrorState(
        message: state.message,
        onRetry: _fetchCart,
      ),
      FetchCartSuccessState()
      when state.cartModel.cartItems?.isNotEmpty ?? false =>
          CartItemsList(cartItems: state.cartModel.cartItems!),
      _ => const CartEmptyState(),
    };
  }
}