import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/components/widgets/elevated_button.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/components/widgets/text_form_field_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../view_model/get_profile_cubit/profile_cubit.dart';
import '../../view_model/get_profile_cubit/profile_state.dart';
import '../../view_model/update_profile_cubit/update_profile_cubit.dart';
import '../../view_model/update_profile_cubit/update_profile_state.dart';
import 'profile_validators.dart';

class PersonalInfoSection extends StatefulWidget {
  final Function(XFile)? onImageSelected;

  const PersonalInfoSection({super.key, this.onImageSelected});

  @override
  State<PersonalInfoSection> createState() => _PersonalInfoSectionState();
}

class _PersonalInfoSectionState extends State<PersonalInfoSection> {
  final _formKey = GlobalKey<FormState>();
  late final Map<String, TextEditingController> _controllers;
  bool _isEditing = false;
  XFile? _selectedImage;

  @override
  void initState() {
    super.initState();
    final state = context.read<GetProfileCubit>().state;
    final user = state is GetProfileSuccess ? state.user : null;
    _controllers = {
      'name': TextEditingController(text: user?.name ?? ''),
      'email': TextEditingController(text: user?.email ?? ''),
      'phone': TextEditingController(text: user?.phone ?? ''),
      'city': TextEditingController(text: user?.city ?? ''),
      'address': TextEditingController(text: user?.address ?? ''),
    };
  }

  @override
  void dispose() {
    for (var c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _selectedImage = image);
      widget.onImageSelected?.call(image);
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      context.read<UpdateProfileCubit>().updateProfile(
        name: _controllers['name']!.text.trim(),
        email: _controllers['email']!.text.trim(),
        phone: _controllers['phone']!.text.trim(),
        city: _controllers['city']!.text.trim(),
        address: _controllers['address']!.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          Functions.showToast('Profile updated successfully');
          context.read<GetProfileCubit>().getProfile();
          setState(() => _isEditing = false);
        } else if (state is UpdateProfileError) {
          Functions.showToast(state.message);
        }
      },
      child: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.kBlack.withAlpha(15),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 16.h),
              if (_isEditing) ...[_buildImagePicker(), SizedBox(height: 16.h)],
              _buildField(
                'name',
                'Name',
                Icons.person_outline,
                ProfileValidators.validateName,
              ),
              SizedBox(height: 12.h),
              _buildField(
                'email',
                'Email',
                Icons.email_outlined,
                ProfileValidators.validateEmail,
                TextInputType.emailAddress,
              ),
              SizedBox(height: 12.h),
              _buildField(
                'phone',
                'Phone',
                Icons.phone_outlined,
                ProfileValidators.validatePhone,
                TextInputType.phone,
              ),
              SizedBox(height: 12.h),
              _buildField(
                'city',
                'City',
                Icons.location_city_outlined,
                ProfileValidators.validateCity,
              ),
              SizedBox(height: 12.h),
              _buildField(
                'address',
                'Address',
                Icons.home_outlined,
                ProfileValidators.validateAddress,
                null,
                2,
              ),
              if (_isEditing) ...[SizedBox(height: 20.h), _buildButtons()],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCustom(
          text: 'Personal Information',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        IconButton(
          onPressed: () => setState(() => _isEditing = !_isEditing),
          icon: Icon(
            _isEditing ? Icons.close : Icons.edit_outlined,
            color: _isEditing ? AppColors.kRed : AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildImagePicker() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryColor, width: 2),
            color: Colors.grey[100],
          ),
          child:
              _selectedImage != null
                  ? CircleAvatar(
                    backgroundImage: FileImage(File(_selectedImage!.path)),
                  )
                  : Icon(
                    Icons.camera_alt,
                    color: AppColors.primaryColor,
                    size: 40.sp,
                  ),
        ),
      ),
    );
  }

  Widget _buildField(
    String key,
    String label,
    IconData icon,
    String? Function(String?)? validator, [
    TextInputType? type,
    int lines = 1,
  ]) {
    return CustomTextFormField(
      controller: _controllers[key],
      labelText: label,
      enabled: _isEditing,
      keyboardType: type,
      validator: validator,
      maxLines: lines,
      prefixIcon: Icon(icon, color: AppColors.primaryColor),
      filledColor:
          _isEditing ? AppColors.kWhite : AppColors.kGrey.withAlpha(60),
    );
  }

  Widget _buildButtons() {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        final loading = state is UpdateProfileLoading;
        return Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                nameOfButton: loading ? 'Saving...' : 'Save Changes',
                backgroundColor: AppColors.primaryColor,
                onPressed: loading ? null : _saveProfile,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomElevatedButton(
                nameOfButton: 'Cancel',
                backgroundColor: AppColors.kGrey,
                onPressed:
                    loading ? null : () => setState(() => _isEditing = false),
              ),
            ),
          ],
        );
      },
    );
  }
}
