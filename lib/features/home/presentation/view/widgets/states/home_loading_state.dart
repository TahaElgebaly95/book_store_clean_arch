// lib/features/home/presentation/view/widgets/states/home_loading_state.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingState extends StatelessWidget {
  const HomeLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      children: [
        // Slider Shimmer
        _SliderShimmer(),
        SizedBox(height: 24.h),

        // Categories Shimmer
        _SectionHeaderShimmer(),
        SizedBox(height: 12.h),
        _HorizontalListShimmer(height: 120.h),
        SizedBox(height: 24.h),

        // Best Sellers Shimmer
        _SectionHeaderShimmer(),
        SizedBox(height: 12.h),
        _HorizontalListShimmer(height: 280.h),
        SizedBox(height: 24.h),

        // New Arrivals Shimmer
        _SectionHeaderShimmer(),
        SizedBox(height: 12.h),
        _HorizontalListShimmer(height: 280.h),
      ],
    );
  }
}

// ==================== Slider Shimmer ====================
class _SliderShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 180.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}

// ==================== Section Header Shimmer ====================
class _SectionHeaderShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 24.h,
          width: 120.w,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    );
  }
}

// ==================== Horizontal List Shimmer ====================
class _HorizontalListShimmer extends StatelessWidget {
  final double height;

  const _HorizontalListShimmer({required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: height == 120.h ? 110.w : 160.w,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ),
    );
  }
}
