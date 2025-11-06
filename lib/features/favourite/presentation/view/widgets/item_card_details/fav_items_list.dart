import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/model/fav_model.dart';
import '../fav_header.dart';
import 'fav_item_card.dart';

class FavItemsList extends StatelessWidget {
  final List<FavouriteItem> favouriteItems;

  const FavItemsList({super.key, required this.favouriteItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FavHeader(itemCount: favouriteItems.length),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                SizedBox(height: 10.h),
            padding: EdgeInsets.all(10.w),
            itemCount: favouriteItems.length,
            itemBuilder: (context, index) {
              return FavItemCard(item: favouriteItems[index]);
            },
          ),
        ),
      ],
    );
  }
}