import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../favourite/presentation/view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../../../../favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';
import '../../../../data/model/all_products_books.dart';

class BookDetailsImage extends StatelessWidget {
  final ProductModel product;

  const BookDetailsImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الصورة
        Container(
          height: 350.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(20),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Center(
                child: Icon(
                  Icons.book_rounded,
                  size: 100.sp,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
        ),

        // Favourite Button
        Positioned(
          top: 16.h,
          left: 16.w,
          child: _buildFavouriteButton(context),
        ),
      ],
    );
  }

  Widget _buildFavouriteButton(BuildContext context) {
    return BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
      builder: (context, favState) {
        return BlocBuilder<AddOrRemoveFavCubit, AddOrRemoveFavState>(
          builder: (context, addFavState) {
            final favCubit = context.read<GetFavouriteCubit>();
            final addFavCubit = context.read<AddOrRemoveFavCubit>();

            final isInFavourite = favCubit.isProductFavourite(product.id);
            final isLoading = addFavState is AddToFavLoadingState ||
                addFavState is RemoveFavLoadingState;

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: isLoading
                    ? null
                    : () {
                  if (isInFavourite) {
                    addFavCubit.removeFavProduct(product.id);
                  } else {
                    addFavCubit.addToFavourite(product.id);
                  }
                },
                icon: isLoading
                    ? SizedBox(
                  width: 24.sp,
                  height: 24.sp,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                )
                    : Icon(
                  isInFavourite ? Icons.favorite : Icons.favorite_border,
                  color: isInFavourite ? Colors.red : Colors.grey[600],
                  size: 28.sp,
                ),
              ),
            );
          },
        );
      },
    );
  }
}