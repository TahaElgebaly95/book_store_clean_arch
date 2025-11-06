// lib/features/home/presentation/view/widgets/states/home_success_state.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/home_cubit/home_cubit.dart';
import '../sections/best_seller_section.dart';
import '../sections/categories_section.dart';
import '../sections/new_arrival_section.dart';
import '../sections/sliders_section.dart';

class HomeSuccessState extends StatelessWidget {
  final HomeLoaded state;

  const HomeSuccessState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Implement refresh logic if needed
      },
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Sliders
          if (state.sliders.isNotEmpty) ...[
            SlidersSection(sliders: state.sliders),
            SizedBox(height: 24.h),
          ],

          // Categories
          if (state.categories.isNotEmpty) ...[
            CategoriesSection(categories: state.categories),
            SizedBox(height: 24.h),
          ],

          // Best Sellers
          if (state.bestSellers.isNotEmpty) ...[
            BestSellersSection(products: state.bestSellers),
            SizedBox(height: 24.h),
          ],

          // New Arrivals
          if (state.newArrivals.isNotEmpty) ...[
            NewArrivalsSection(products: state.newArrivals),
            SizedBox(height: 24.h),
          ],
        ],
      ),
    );
  }
}