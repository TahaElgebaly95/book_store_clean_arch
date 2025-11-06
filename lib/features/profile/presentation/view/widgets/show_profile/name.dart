// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../core/components/widgets/text_form_field_custom.dart';
// import '../../../../../../core/utils/colors.dart';
// import '../../../view_model/get_profile_cubit/profile_cubit.dart';
//
// class Name extends StatelessWidget {
//   const Name({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ProfileCubit, ProfileState>(
//       builder: (context, state) {
//         var cubit = BlocProvider.of<ProfileCubit>(context);
//         return CustomTextFormField(
//           enabled: cubit.isEditProfileButton,
//           border: OutlineInputBorder(
//               borderSide:
//               const BorderSide(width: 2, color: AppColors.primaryColor),
//               borderRadius: BorderRadius.circular(12.r)),
//           controller:cubit.nameController,
//           hintText: 'Name',
//           labelText: 'Name',
//           hintTextStyle: const TextStyle(color: AppColors.primaryColor),
//           labelTextStyle: const TextStyle(color: AppColors.primaryColor),
//           textInputAction: TextInputAction.next,
//           keyboardType: TextInputType.name,
//           prefixIcon: const Icon(
//             Icons.drive_file_rename_outline_sharp,
//             color: AppColors.primaryColor,
//           ),
//         );
//       },
//       listener: (context, state) {},
//     );
//   }
// }
