import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';

class FavEmptyState extends StatelessWidget {
  const FavEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 120.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20.h),
          TextCustom(
            text: 'No Favourites Yet',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
          SizedBox(height: 10.h),
          TextCustom(
            text: 'Start adding books to your favourites',
            fontSize: 16.sp,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }
}