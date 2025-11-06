import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemImage extends StatelessWidget {
  final String? imageUrl;

  const CartItemImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 80.w,
        height: 100.h,
        color: Colors.grey[200],
        child: imageUrl != null
            ? Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.book_rounded,
            size: 40.sp,
            color: Colors.grey[400],
          ),
        )
            : Icon(
          Icons.book_rounded,
          size: 40.sp,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}