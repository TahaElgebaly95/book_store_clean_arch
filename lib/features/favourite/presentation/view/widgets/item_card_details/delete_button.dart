import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/model/fav_model.dart';
import '../../../view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../../view_model/get_fav_cubit/get_favourite_cubit.dart';

class DeleteButton extends StatelessWidget {
  final FavouriteItem item;

  const DeleteButton({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
      builder: (context, favState) {
        return BlocBuilder<AddOrRemoveFavCubit, AddOrRemoveFavState>(
          builder: (context, addFavState) {
            final favCubit = context.read<GetFavouriteCubit>();
            final isInFavourite = favCubit.isProductFavourite(item.id ?? 0);
            final isLoading = addFavState is RemoveFavLoadingState;

            return InkWell(
              onTap: isLoading ? null : () => _showDeleteDialog(context),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: isLoading ? Colors.grey[200] : Colors.red[50],
                  border: Border.all(
                    color: isInFavourite ? Colors.red : Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: isLoading
                    ? SizedBox(
                  width: 24.sp,
                  height: 24.sp,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                )
                    : Icon(
                  isInFavourite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 24.sp,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Remove from Favourites'),
        content: const Text(
          'Are you sure you want to remove this item from your favourites?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              if (item.id != null) {
                context
                    .read<AddOrRemoveFavCubit>()
                    .removeFavProduct(item.id!);
              }
            },
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}