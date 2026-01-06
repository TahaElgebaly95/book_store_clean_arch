import 'package:book_store_mvvm/core/utils/routing/routs.dart';
import 'package:book_store_mvvm/features/profile/presentation/view/widgets/change_password_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../view_model/get_profile_cubit/profile_cubit.dart';
import '../../view_model/get_profile_cubit/profile_state.dart';
import 'danger_zone_section.dart';
import 'personal_info_section.dart';
import 'profile_header.dart';
import 'profile_listeners.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileListeners(
      child: BlocBuilder<GetProfileCubit, GetProfileState>(
        builder: (context, state) {
          if (state is GetProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetProfileSuccess) {
            return _ProfileContent(user: state.user);
          }

          if (state is GetProfileError) {
            return _buildErrorWidget(context, state);
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, GetProfileError state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 80, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            state.message,
            style: const TextStyle(fontSize: 16, color: Colors.red),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<GetProfileCubit>().getProfile(),
            child: const Text('إعادة محاولة'),
          ),
        ],
      ),
    );
  }
}

class _ProfileContent extends StatefulWidget {
  final user;

  const _ProfileContent({required this.user});

  @override
  State<_ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<_ProfileContent> {
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeader(
            name: widget.user.name,
            email: widget.user.email,
            selectedImage: _selectedImage,
            onLogout: () {
              context.pushReplacement(Routs.loginRoute);
            },
          ),
          PersonalInfoSection(
            onImageSelected: (image) => setState(() => _selectedImage = image),
          ),
          ChangePasswordTextButton(),
          const DangerZoneSection(),
        ],
      ),
    );
  }
}
