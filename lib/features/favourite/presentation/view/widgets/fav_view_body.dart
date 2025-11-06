import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/get_fav_cubit/get_favourite_cubit.dart';
import 'fav_empty_state.dart';
import 'fav_error_state.dart';
import 'item_card_details/fav_items_list.dart';
import 'fav_listeners.dart';
import 'fav_loading_state.dart';

class FavouriteViewBody extends StatefulWidget {
  const FavouriteViewBody({super.key});

  @override
  State<FavouriteViewBody> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<FavouriteViewBody> {
  @override
  void initState() {
    super.initState();
    _fetchFavourites();
  }

  void _fetchFavourites() => context.read<GetFavouriteCubit>().getFavourite();

  @override
  Widget build(BuildContext context) {
    return FavListeners(
      BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
        builder: (context, state) => _buildFavState(state),
      ),
    );
  }

  Widget _buildFavState(GetFavouriteState state) {
    return switch (state) {
      GetFavouriteLoadingState() => const FavLoadingState(),
      GetFavouriteErrorState() => FavErrorState(
        message: state.error,
        onRetry: _fetchFavourites,
      ),
      GetFavouriteSuccessState()
          when state.favouriteModel.data?.dataFavItem?.isNotEmpty ?? false =>
        FavItemsList(favouriteItems: state.favouriteModel.data!.dataFavItem!),
      _ => const FavEmptyState(),
    };
  }
}
