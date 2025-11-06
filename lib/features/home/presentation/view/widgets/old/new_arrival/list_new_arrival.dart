// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../core/components/widgets/text_custom.dart';
// import '../../../view_model/new_arrival_cubit/new_arrival_cubit.dart';
// import 'new_arrival_widget.dart';
//
// class ListOfNewArrival extends StatelessWidget {
//   const ListOfNewArrival({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewArrivalCubit, NewArrivalState>(
//       builder: (context, state) {
//         if (state is NewArrivalSuccessState) {
//           return SizedBox(
//             child: ListView.separated(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemBuilder:
//                   (context, index) => NewArrivalWidget(
//                     onTap: () {},
//                     products: state.newArrival[index],
//                   ),
//               separatorBuilder: (context, index) => SizedBox(width: 0.w),
//               itemCount: state.newArrival.length,
//             ),
//           );
//         } else {
//           return Center(child: TextCustom(text: 'Error this page'));
//         }
//       },
//     );
//   }
// }
