import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/service_locator.dart';
import '../../../features/favourite/presentation/view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../../features/favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';
import '../../../features/cart/presentation/view_model/fetch_cart_cubit/fetch_cart_cubit.dart';
import '../../../features/cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../features/cart/presentation/view_model/update_cart_cubit/update_cart_cubit.dart';

class CommonBlocProviders extends StatelessWidget {
  final Widget child;

  const CommonBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Favourite Feature
        BlocProvider(
          create: (context) => sl<GetFavouriteCubit>()..getFavourite(),
        ),
        BlocProvider(create: (context) => sl<AddOrRemoveFavCubit>()),

        // Cart Feature
        BlocProvider(
          create: (context) => sl<FetchCartCubit>()..fetchCart(),
        ),
        BlocProvider(create: (context) => sl<AddOrRemoveToCartCubit>()),
        BlocProvider(create: (context) => sl<UpdateCartCubit>()),
      ],
      child: child,
    );
  }
}
