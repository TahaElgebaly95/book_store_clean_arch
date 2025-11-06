import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../../../cart/presentation/view_model/fetch_cart_cubit/fetch_cart_cubit.dart';
import '../../../../../favourite/presentation/view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../../../../favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';
import 'books_details_msg.dart';


class BookDetailsListeners extends StatelessWidget {
  final Widget child;

  const BookDetailsListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddOrRemoveFavCubit, AddOrRemoveFavState>(
          listener: _handleFavOperations,
        ),
        BlocListener<AddOrRemoveToCartCubit, AddOrRemoveToCartState>(
          listener: _handleCartOperations,
        ),
      ],
      child: child,
    );
  }
}

void _handleFavOperations(BuildContext context, AddOrRemoveFavState state) {
  if (state is AddToFavSuccessState) {
    _refreshFavourites(context);
    _showMessage(context, 'Added to favourites ❤️', BookDetailsMessageType.success);
  } else if (state is RemoveFavSuccessState) {
    _refreshFavourites(context);
    _showMessage(context, 'Removed from favourites', BookDetailsMessageType.warning);
  } else if (state is AddToFavErrorState) {
    _showMessage(context, state.error, BookDetailsMessageType.error);
  } else if (state is RemoveFavErrorState) {
    _showMessage(context, state.error, BookDetailsMessageType.error);
  }
}

void _handleCartOperations(BuildContext context, AddOrRemoveToCartState state) {
  if (state is AddToCartSuccessState) {
    _refreshCart(context);
    _showMessage(context, 'Added to cart successfully 🛒', BookDetailsMessageType.success);
  } else if (state is RemoveFromCartSuccessState) {
    _refreshCart(context);
    _showMessage(context, 'Removed from cart', BookDetailsMessageType.warning);
  } else if (state is AddToCartErrorState) {
    _showMessage(context, state.message, BookDetailsMessageType.error);
  } else if (state is RemoveFromCartErrorState) {
    _showMessage(context, state.message, BookDetailsMessageType.error);
  }
}

void _refreshFavourites(BuildContext context) {
  context.read<GetFavouriteCubit>().getFavourite();
}

void _refreshCart(BuildContext context) {
  context.read<FetchCartCubit>().fetchCart();
}

void _showMessage(BuildContext context, String message, BookDetailsMessageType type) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: type.color,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ),
  );
}