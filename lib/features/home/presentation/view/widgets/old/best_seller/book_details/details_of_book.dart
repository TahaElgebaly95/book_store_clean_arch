// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../../core/components/widgets/text_custom.dart';
// import '../../../../../../../core/utils/colors.dart';
// import '../../../../../../books/data/model/all_products_books.dart';
//
// class DetailsOfBook extends StatelessWidget {
//   const DetailsOfBook({required this.products, super.key});
//
//   final ProductModel products;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 10.h),
//         TextCustom(
//           text: products.name,
//           fontSize: 20.sp,
//           fontWeight: FontWeight.bold,
//           color: AppColors.kBlack,
//         ),
//         Row(
//           children: [
//             TextCustom(
//               text: products.category,
//               fontSize: 15.sp,
//               color: AppColors.kGrey,
//             ),
//             const Spacer(),
//             Column(
//               children: [
//                 TextCustom(
//                   decoration: TextDecoration.lineThrough,
//                   text: products.price.toString(),
//                   fontSize: 15.sp,
//                   color: AppColors.kGrey,
//                 ),
//                 TextCustom(
//                   softWrap: true,
//                   text: products.priceAfterDiscount.toString(),
//                   fontSize: 15.sp,
//                   color: AppColors.kCyan,
//                 ),
//               ],
//             ),
//           ],
//         ),
//         TextCustom(
//           text: 'Description:',
//           color: AppColors.kBlack,
//           fontWeight: FontWeight.bold,
//           fontSize: 20.sp,
//         ),
//         SizedBox(height: 10.h),
//         TextCustom(
//           softWrap: true,
//           text: products.description,
//           fontSize: 14.sp,
//           color: AppColors.kGrey,
//         ),
//         SizedBox(height: 10.h),
//       ],
//     );
//   }
// }
