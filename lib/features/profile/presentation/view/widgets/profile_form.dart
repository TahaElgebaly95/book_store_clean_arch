// import 'package:book_store_mvvm/core/components/widgets/text_form_field_custom.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../view_model/profile_cubit.dart';
//
// class ProfileForm extends StatefulWidget {
//   const ProfileForm({super.key});
//
//   @override
//   _ProfileFormState createState() => _ProfileFormState();
// }
//
// class _ProfileFormState extends State<ProfileForm> {
//   // 1. Controllers live and die here in the state of the widget
//   late final TextEditingController _nameController;
//   late final TextEditingController _emailController;
//   late final TextEditingController _phoneController;
//   late final TextEditingController _cityController;
//   late final TextEditingController _addressController;
//   // ... other controllers
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers, perhaps with initial data from the cubit's state
//     final user = context.read<ProfileCubit>().state;
//     _nameController = TextEditingController(text: user.name);
//     _emailController = TextEditingController(text: user.email);
//     _phoneController = TextEditingController(text: user.phone);
//     _cityController = TextEditingController(text: user.city);
//     _addressController = TextEditingController(text: user.address);
//   }
//
//   @override
//   void dispose() {
//     // 2. Always dispose of controllers to prevent memory leaks!
//     _nameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _cityController.dispose();
//     _addressController.dispose();
//     super.dispose();
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Column(
//   //     children: [
//   //       CustomTextFormField(controller: _nameController, InputDecoration(labelText: 'Name')),
//   //       TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
//   //       // ... other text fields
//   //       ElevatedButton(
//   //         onPressed: () {
//   //           // 3. Pass PURE DATA (String), not the controller itself, to the cubit
//   //           context.read<ProfileCubit>().updateProfile(
//   //             name: _nameController.text,
//   //             email: _emailController.text,
//   //             // ... pass other string values
//   //           );
//   //         },
//   //         child: Text('Update Profile'),
//   //       ),
//   //     ],
//   //   );
//   // }
// }