import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';

class FavHeader extends StatelessWidget {
  final int itemCount;

  const FavHeader({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(10),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 24.sp,
          ),
          SizedBox(width: 10.w),
          TextCustom(
            text: '$itemCount ${itemCount == 1 ? 'Favourite' : 'Favourites'}',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}