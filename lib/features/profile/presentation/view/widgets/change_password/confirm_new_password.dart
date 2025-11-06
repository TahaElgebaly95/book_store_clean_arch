// import 'package:book_store_mvvm/features/profile/presentation/view_model/get_profile_cubit/profile_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../../core/components/widgets/text_form_field_custom.dart';
// import '../../../../../../core/utils/colors.dart';
//
// class ConfirmNewPassword extends StatelessWidget {
//   const ConfirmNewPassword({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     //var cubit = UpdatePasswordCubit.get(context);
//     return BlocBuilder<ProfileCubit, ProfileState>(
//       builder: (context, state) {
//         return CustomTextFormField(
//             //controller: ProfileRepoImpl.get(context).confirmPasswordController,
//             keyboardType: TextInputType.visiblePassword,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             prefixIcon: const Icon(Icons.lock,color: AppColors.primaryColor,),
//             validator: (value) {
//               if ((value ?? '').isEmpty) {
//                 return 'Enter your password';
//               } else if (!RegExp(r'[A-Z]').hasMatch(value!)) {
//                 return 'Password should has at least one uppercase letter';
//               } else if (!RegExp(r'[!@#\\$%^&*(),.?":{}|<>]')
//                   .hasMatch(value)) {
//                 return 'Password should has special character';
//               } else if (!RegExp(r'[1-9]').hasMatch(value)) {
//                 return 'password should has one number at least';
//               } else if ((value.length ) < 8) {
//                 return 'Password can\'t be less than 8 Characters';
//               }
//               return null;
//             },
//             hintText: 'Confirm New Password',
//           // obscureText: .isConfirmPasswordVisible ? true : false,
//           // suffixIcon: IconButton(
//           //   icon: cubit.isConfirmPasswordVisible
//           //       ? const Icon(Icons.visibility)
//           //       : const Icon(Icons.visibility_off),
//           //   color: cubit.isConfirmPasswordVisible ? AppColors.primaryColor : AppColors.kGrey,
//           //   onPressed: () {
//           //     cubit.changeConfirmPasswordVisibility();
//           //   },
//           // ),
//         );
//       },
//     );
//   }
// }
