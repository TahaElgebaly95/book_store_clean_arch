// import 'package:book_store_mvvm/features/home/presentation/view/widgets/best_seller/best_seller_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../view_model/best_seller_cubit/best_seller_cubit.dart';
//
// class ListOfBestSeller extends StatelessWidget {
//   const ListOfBestSeller({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BestSellerCubit, BestSellerState>(
//       builder: (context, state) {
//         if (state is BestSellerSuccessState) {
//           return SizedBox(
//             height: 250.h,
//             width: 125.w,
//             child: ListView.separated(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemBuilder:
//                   (context, index) => BestSellerWidget(
//                     products: state.bestSeller[index],
//                     onTap: () {},
//                   ),
//               separatorBuilder: (context, index) => SizedBox.shrink(),
//               itemCount: state.bestSeller.length,
//             ),
//           );
//         } else {
//           return const Center(child: Text('Error ya z3em'));
//         }
//       },
//     );
//   }
// }
