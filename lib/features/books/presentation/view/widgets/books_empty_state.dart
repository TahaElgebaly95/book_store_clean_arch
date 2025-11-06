import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';

class BooksEmptyState extends StatelessWidget {
  const BooksEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 120.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20.h),
          TextCustom(
            text: 'No Books Found',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
          SizedBox(height: 10.h),
          TextCustom(
            text: 'Try searching with different keywords',
            fontSize: 16.sp,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }
}