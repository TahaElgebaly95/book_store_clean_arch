import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/components/widgets/text_form_field_custom.dart';
import '../../../../../../core/utils/colors.dart';
import 'checkout_form_controller.dart';
import 'checkout_validators.dart';
import 'governorate_dropdown.dart';

class CheckoutAddressSection extends StatelessWidget {
  final CheckoutFormController controller;
  final VoidCallback onChanged;

  const CheckoutAddressSection({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 8.h),
          _buildRequiredNote(),
          SizedBox(height: 16.h),
          CustomTextFormField(
            controller: controller.nameController,
            labelText: 'Full Name *',
            hintText: 'Enter your name',
            prefixIcon: const Icon(Icons.person_outline),
            validator: CheckoutValidators.validateName,
            onChanged: (_) => onChanged(),
            showErrorMessage: true,
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            controller: controller.phoneController,
            labelText: 'Phone Number *',
            hintText: 'Enter your phone number',
            prefixIcon: const Icon(Icons.phone_outlined),
            keyboardType: TextInputType.phone,
            validator: CheckoutValidators.validatePhone,
            onChanged: (_) => onChanged(),
            showErrorMessage: true,
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            controller: controller.emailController,
            labelText: 'Email Address *',
            hintText: 'Enter your email',
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: CheckoutValidators.validateEmail,
            onChanged: (_) => onChanged(),
            showErrorMessage: true,
          ),
          SizedBox(height: 16.h),
          GovernorateDropdown(
            value: controller.selectedGovernorateId,
            onChanged: (value) {
              controller.selectedGovernorateId = value!;
              onChanged();
            },
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            controller: controller.addressController,
            labelText: 'Delivery Address *',
            hintText: 'Enter your delivery address',
            prefixIcon: const Icon(Icons.home_outlined),
            maxLines: 3,
            validator: CheckoutValidators.validateAddress,
            onChanged: (_) => onChanged(),
            showErrorMessage: true,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          color: AppColors.primaryColor,
          size: 24.sp,
        ),
        SizedBox(width: 8.w),
        TextCustom(
          text: 'Delivery Information',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.kBlack,
        ),
      ],
    );
  }

  Widget _buildRequiredNote() {
    return Row(
      children: [
        Icon(Icons.info_outline, size: 16.sp, color: Colors.orange),
        SizedBox(width: 8.w),
        TextCustom(
          text: 'All fields marked with (*) are required',
          fontSize: 12.sp,
          color: Colors.orange,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}