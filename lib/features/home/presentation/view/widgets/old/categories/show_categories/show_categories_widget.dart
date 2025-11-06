// // lib/features/home/presentation/screens/category_products_screen.dart
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../view_model/home_cubit/home_cubit.dart';
// import '../../items/product_card.dart';
//
// class CategoryProductsScreen extends StatelessWidget {
//   final int categoryId;
//
//   const CategoryProductsScreen({
//     required this.categoryId,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Category Products'),
//       ),
//       body: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           if (state is CategoryProductsLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (state is CategoryProductsError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.error_outline, size: 64, color: Colors.red),
//                   const SizedBox(height: 16),
//                   Text(state.message),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () => context
//                         .read<HomeCubit>()
//                         .loadCategoryProducts(categoryId),
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }
//
//           if (state is CategoryProductsLoaded) {
//             if (state.products.isEmpty) {
//               return const Center(
//                 child: Text('No products found in this category'),
//               );
//             }
//
//             return GridView.builder(
//               padding: EdgeInsets.all(16.sp),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 12.w,
//                 mainAxisSpacing: 12.h,
//                 childAspectRatio: 0.7,
//               ),
//               itemCount: state.products.length,
//               itemBuilder: (context, index) => ProductCard(
//                 product: state.products[index],
//                 onTap: () => context.push('/product/${state.products[index].id}'),
//               ),
//             );
//           }
//
//           return const SizedBox.shrink();
//         },
//       ),
//     );
//   }
// }