// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../core/components/widgets/text_custom.dart';
// import '../../../../../../core/utils/colors.dart';
// import '../../../../data/model/products/all_products_model.dart';
//
// class BestSellerWidget extends StatelessWidget {
//   const BestSellerWidget({
//     required this.products,
//     required this.onTap,
//     super.key,
//   });
//
//   final Products products;
//   final void Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0.sp),
//       child: SizedBox(
//         height: 250.h,
//         width: 140.w,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 InkWell(
//                   onTap: onTap,
//                   child: Container(
//                     height: 170.h,
//                     width: 140.w,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       image: DecorationImage(
//                         image: NetworkImage('${products.image}'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 5.h,
//                   left: 7.w,
//                   child: TextCustom(
//                     text: '${products.discount.toString()}% OFF',
//                     color: AppColors.kRed,
//                     fontSize: 14.sp,
//                     backgroundColor: AppColors.kWhite,
//                   ),
//                 ),
//               ],
//             ),
//             TextCustom(
//               text: products.name ?? '',
//               fontSize: 15.sp,
//               fontWeight: FontWeight.bold,
//               overflow: TextOverflow.ellipsis,
//             ),
//             //  TextCustom(text: products.category ?? ''),
//             TextCustom(
//               text: 'EGP ${products.priceAfterDiscount}',
//               color: AppColors.kGrey,
//               decoration: TextDecoration.lineThrough,
//               fontSize: 15.sp,
//             ),
//             TextCustom(
//               text: 'EGP ${products.price}',
//               fontSize: 16.sp,
//               color: AppColors.kCyan,
//               fontWeight: FontWeight.bold,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
