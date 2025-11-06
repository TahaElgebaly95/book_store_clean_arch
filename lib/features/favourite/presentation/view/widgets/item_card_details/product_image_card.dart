import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/model/fav_model.dart';

class ProductImageCard extends StatelessWidget {
  const ProductImageCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return _buildProductImage();
  }

final FavouriteItem item;
  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 80.w,
        height: 100.h,
        color: Colors.grey[200],
        child:
            item.image != null
                ? Image.network(
                  item.image!,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Icon(
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
