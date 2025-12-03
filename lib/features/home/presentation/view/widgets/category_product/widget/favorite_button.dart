// lib/features/home/presentation/view/widgets/category_product/widgets/favorite_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';

class FavoriteButton extends StatelessWidget {
  final int productId;
  final VoidCallback onTap;

  const FavoriteButton({
    required this.productId,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 6.h,
      right: 6.w,
      child: BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
        builder: (context, state) {
          final isFavorite = _checkIfFavorite(state);

          return GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(900),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey[700],
                size: 16.sp,
              ),
            ),
          );
        },
      ),
    );
  }

  bool _checkIfFavorite(GetFavouriteState state) {
    if (state is! GetFavouriteSuccessState) return false;

    return state.favouriteModel.data?.dataFavItem?.any(
          (fav) => fav.id == productId,
    ) ??
        false;
  }
}