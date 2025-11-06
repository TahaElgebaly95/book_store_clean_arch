// lib/features/home/presentation/view/screens/category_products_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../../cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../../favourite/presentation/view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../../../favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';
import '../../view_model/home_cubit/home_cubit.dart';
import '../widgets/category_product/category_product_loading.dart';
import '../widgets/category_product/category_products_error.dart';
import '../widgets/category_product/category_products_grid.dart';

class CategoryProductsScreen extends StatefulWidget {
  final int categoryId;
  final String? categoryName;

  const CategoryProductsScreen({
    required this.categoryId,
    this.categoryName,
    super.key,
  });

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  void initState() {
    super.initState();
    // Load category products on init
    context.read<HomeCubit>().loadCategoryProducts(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ✅ Provide Favorite & Cart cubits for the grid
        BlocProvider(create: (context) => sl<AddOrRemoveFavCubit>()),
        BlocProvider(create: (context) => sl<GetFavouriteCubit>()..getFavourite()),
        BlocProvider(create: (context) => sl<AddOrRemoveToCartCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.categoryName ?? 'Products',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is CategoryProductsLoading) {
              return const CategoryProductsLoadingNew();
            }

            if (state is CategoryProductsError) {
              return CategoryProductsErrorNew(
                message: state.message,
                onRetry: () {
                  context.read<HomeCubit>().loadCategoryProducts(widget.categoryId);
                },
              );
            }

            if (state is CategoryProductsLoaded) {
              return CategoryProductsGrid(products: state.products);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}