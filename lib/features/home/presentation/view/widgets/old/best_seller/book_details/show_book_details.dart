// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../../core/components/widgets/elevated_button.dart';
// import '../../../../../../../core/utils/colors.dart';
// import '../../../../../../books/data/model/all_products_books.dart';
// import 'container_of_image.dart';
// import 'details_of_book.dart';
//
// class ShowBookDetails extends StatelessWidget {
//   const ShowBookDetails({super.key, required this.product, this.onPressed, required this.index});
//
//   final int index;
//   final ProductModel product;
//   final void Function()? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(color: AppColors.kWhite),
//               child: ListView(
//                 shrinkWrap: true,
//                 children: [
//                   Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       ContainerOfImage(imageUrl: product.image),
//                       Positioned(
//                         top: 35.h,
//                         right: 20.w,
//                         child: CircleAvatar(
//                           radius: 30.r,
//                           backgroundColor: AppColors.kTransparent.withAlpha(5),
//                           child: IconButton(
//                             onPressed: onPressed,
//                             icon: Icon(
//                               Icons.favorite_border_outlined,
//                               color: AppColors.kRed,
//                               size: 35.sp,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(10.0.sp),
//                     child: DetailsOfBook(products: product),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           CustomElevatedButton(
//             nameOfButton: 'Add to Cart',
//             onPressed: () {
//               // CartCubit.get(context).addToCart(id: products.id!);
//             },
//             backgroundColor: AppColors.primaryColor,
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
