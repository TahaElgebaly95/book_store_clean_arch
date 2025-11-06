//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../core/components/widgets/text_custom.dart';
// import '../../../../../core/utils/colors.dart';
// import '../../view_model/faq_cubit/faq_cubit.dart';
//
// class FaqCategories extends StatelessWidget {
//   final List<String> categories = [
//     'All',
//     'Orders',
//     'Payment',
//     'Shipping',
//     'Returns',
//     'Account',
//   ];
//
//   FaqCategories({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50.h,
//       margin: EdgeInsets.symmetric(vertical: 16.h),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           final category = categories[index];
//           final cubit = context.watch<FaqCubit>();
//           final isSelected = category == 'All'
//               ? cubit.selectedCategory == null
//               : cubit.selectedCategory == category;
//
//           return GestureDetector(
//             onTap: () {
//               if (category == 'All') {
//                 cubit.getAllFaqs();
//               } else {
//                 cubit.getFaqsByCategory(category);
//               }
//             },
//             child: Container(
//               margin: EdgeInsets.only(right: 12.w),
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
//               decoration: BoxDecoration(
//                 color: isSelected
//                     ? AppColors.primaryColor
//                     : Colors.white,
//                 borderRadius: BorderRadius.circular(25.r),
//                 border: Border.all(
//                   color: isSelected
//                       ? AppColors.primaryColor
//                       : Colors.grey[300]!,
//                 ),
//                 boxShadow: isSelected
//                     ? [
//                   BoxShadow(
//                     color: AppColors.primaryColor.withOpacity(0.3),
//                     blurRadius: 8,
//                     offset: const Offset(0, 2),
//                   ),
//                 ]
//                     : null,
//               ),
//               child: Center(
//                 child: TextCustom(
//                   text: category,
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w600,
//                   color: isSelected ? Colors.white : Colors.grey[700],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }