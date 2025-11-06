import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import 'checkout_form_controller.dart';
import 'payment_option_widget.dart';

class CheckoutPaymentSection extends StatelessWidget {
  final CheckoutFormController controller;
  final VoidCallback onChanged;

  const CheckoutPaymentSection({
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
          SizedBox(height: 16.h),
          PaymentOptionWidget(
            value: 'cash',
            title: 'Cash on Delivery',
            icon: Icons.money,
            groupValue: controller.selectedPaymentMethod,
            onChanged: (value) {
              controller.selectedPaymentMethod = value;
              onChanged();
            },
          ),
          SizedBox(height: 12.h),
          PaymentOptionWidget(
            value: 'card',
            title: 'Credit/Debit Card',
            icon: Icons.credit_card,
            groupValue: controller.selectedPaymentMethod,
            onChanged: (value) {
              controller.selectedPaymentMethod = value;
              onChanged();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(
          Icons.payment_outlined,
          color: AppColors.primaryColor,
          size: 24.sp,
        ),
        SizedBox(width: 8.w),
        TextCustom(
          text: 'Payment Method',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.kBlack,
        ),
      ],
    );
  }
}