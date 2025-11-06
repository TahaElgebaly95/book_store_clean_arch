// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../core/components/widgets/text_custom.dart';
// import '../../../../../../core/utils/colors.dart';
// import '../../../../data/model/categories/categories_model.dart';
//
// class CategoriesWidget extends StatelessWidget {
//   const CategoriesWidget({super.key, required this.categories, this.onTap});
//
//   final Categories categories;
//   final void Function()? onTap;
//
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         margin: EdgeInsets.symmetric(horizontal: 5.w),
//         alignment: Alignment.center,
//         width: 110.w,
//         height: 125.h,
//         // color: AppColors.primaryColor,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12.r),
//           image: const DecorationImage(
//             image: AssetImage('assets/images/profile.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           children: [
//             TextCustom(
//               textAlign: TextAlign.center,
//               text: categories.name ?? '',
//               color: AppColors.kWhite,
//               fontWeight: FontWeight.bold,
//               fontSize: 18.sp,
//               overflow: TextOverflow.ellipsis,
//             ),
//             TextCustom(
//               textAlign: TextAlign.center,
//               text: categories.productsCount.toString(),
//               color: AppColors.kWhite,
//               fontWeight: FontWeight.bold,
//               fontSize: 18.sp,
//             ),
//             TextCustom(
//               textAlign: TextAlign.center,
//               text: categories.id.toString(),
//               color: AppColors.kWhite,
//               fontWeight: FontWeight.bold,
//               fontSize: 18.sp,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
