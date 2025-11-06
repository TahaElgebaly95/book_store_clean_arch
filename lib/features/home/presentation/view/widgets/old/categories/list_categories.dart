// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import '../../../../../../core/utils/routing/routs.dart';
// import '../../../view_model/category_cubit/categories_cubit.dart';
// import '../../../view_model/category_cubit/categories_state.dart';
// import 'categories_widget.dart';
//
// class ListOfCategories extends StatelessWidget {
//   const ListOfCategories({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategoriesCubit, CategoriesState>(
//       builder: (context, state) {
//         var cubit = CategoriesCubit.get(context);
//         if (state is CategoriesSuccessState) {
//           return SizedBox(
//             height: 125.h,
//             width: 100.w,
//             child: ListView.separated(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemBuilder:
//                   (context, index) => CategoriesWidget(
//                     onTap: () {
//                       cubit.showCategories(id: state.categories[index].id!);
//                       context.pushReplacement(
//                         '${Routs.showCategoriesRoute}/${state.categories[index].id}',
//                       );
//                     },
//                     categories: state.categories[index],
//                   ),
//               separatorBuilder: (context, index) => SizedBox(width: 0.w),
//               itemCount: state.categories.length,
//             ),
//           );
//         } else if (state is CategoriesErrorState) {
//           return Center(child: Text(state.error));
//         } else if (state is CategoriesLoadingState) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }
