import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/get_profile_cubit/profile_cubit.dart';
import '../../view_model/get_profile_cubit/profile_state.dart';

class ProfileListeners extends StatelessWidget {
  final Widget child;

  const ProfileListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetProfileCubit, GetProfileState>(
      listener: (context, state) {
        if (state is GetProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: child,
    );
  }
}