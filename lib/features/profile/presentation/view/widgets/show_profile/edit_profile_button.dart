// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../core/components/widgets/elevated_button.dart';
// import '../../../../../../core/utils/colors.dart';
// import '../../../view_model/get_profile_cubit/profile_cubit.dart';
//
// class EditProfileButton extends StatelessWidget {
//   const EditProfileButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ProfileCubit, ProfileState>(
//       builder: (context, state) {
//         var cubit = ProfileCubit.get(context);
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15.w),
//           child: CustomElevatedButton(
//             nameOfButton:
//                 state is ChangeEditButtonSuccessState
//                     ? 'Update Profile'
//                     : 'Edit Profile',
//             onPressed: () {
//               cubit.changeEditProfileButton();
//               if (state is ChangeEditButtonSuccessState) {
//                 cubit.updateProfile(
//                   name: cubit.nameController.text,
//                   email: cubit.emailController.text,
//                   phone: cubit.phoneController.text,
//                   city: cubit.cityController.text,
//                   address: cubit.addressController.text,
//                 );
//               }
//             },
//             backgroundColor:
//                 state is ChangeEditButtonSuccessState
//                     ? AppColors.kAmber
//                     : AppColors.primaryColor,
//           ),
//         );
//       },
//       listener: (context, state) {},
//     );
//   }
// }
