import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../../cart/presentation/view_model/fetch_cart_cubit/fetch_cart_cubit.dart';
import '../../view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../view_model/get_fav_cubit/get_favourite_cubit.dart';
import 'fav_message_type.dart';

class FavListeners extends StatelessWidget {
  const FavListeners(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Listener للـ Favourite operations
        BlocListener<AddOrRemoveFavCubit, AddOrRemoveFavState>(
          listener: _handleFavOperations,
        ),
        // Listener للـ Cart operations
        BlocListener<AddOrRemoveToCartCubit, AddOrRemoveToCartState>(
          listener: _handleCartOperations,
        ),
      ],
      child: child,
    );
  }
}

void _handleFavOperations(BuildContext context, AddOrRemoveFavState state) {
  switch (state) {
    case AddToFavSuccessState():
      _refreshFavourites(context);
      _showMessage(context, 'Added to favourites ❤️', FavMessageType.success);
    case RemoveFavSuccessState():
      _refreshFavourites(context);
      _showMessage(context, 'Removed from favourites', FavMessageType.warning);
    case AddToFavErrorState():
      _showMessage(context, state.error, FavMessageType.error);
    case RemoveFavErrorState():
      _showMessage(context, state.error, FavMessageType.error);
    default:
      break;
  }
}

void _handleCartOperations(BuildContext context, AddOrRemoveToCartState state) {
  if (state is AddToCartSuccessState) {
    _refreshCart(context);
    _showMessage(
      context,
      'Added to cart successfully 🛒',
      FavMessageType.success,
    );
  } else if (state is RemoveFromCartSuccessState) {
    _refreshCart(context);
    _showMessage(context, 'Removed from cart', FavMessageType.warning);
  } else if (state is AddToCartErrorState) {
    _showMessage(context, state.message, FavMessageType.error);
  } else if (state is RemoveFromCartErrorState) {
    _showMessage(context, state.message, FavMessageType.error);
  }
}

void _refreshFavourites(BuildContext context) {
  context.read<GetFavouriteCubit>().getFavourite();
}

void _refreshCart(BuildContext context) {
  context.read<FetchCartCubit>().fetchCart();
}

void _showMessage(BuildContext context, String message, FavMessageType type) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: type.color,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ),
  );
}
