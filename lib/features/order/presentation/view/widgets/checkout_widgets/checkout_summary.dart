import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/model/ckechout_model.dart';
import '../../../view_model/place_order_cubit/place_order_cubit.dart';
import 'checkout_form_controller.dart';

class CheckoutSummary extends StatelessWidget {
  final CheckOutData checkout;
  final CheckoutFormController controller;

  const CheckoutSummary({
    super.key,
    required this.checkout,
    required this.controller,
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
        children: [
          _buildHeader(),
          SizedBox(height: 16.h),
          Divider(height: 1.h),
          SizedBox(height: 16.h),
          _buildTotalRow(),
          SizedBox(height: 20.h),
          _buildPlaceOrderButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(Icons.receipt_long_outlined, color: AppColors.primaryColor, size: 24.sp),
        SizedBox(width: 8.w),
        TextCustom(
          text: 'Order Summary',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.kBlack,
        ),
      ],
    );
  }

  Widget _buildTotalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCustom(
          text: 'Total',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.kBlack,
        ),
        TextCustom(
          text: '${checkout.total} EGP',
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }

  Widget _buildPlaceOrderButton(BuildContext context) {
    return BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
      builder: (context, state) {
        final isLoading = state is PlaceOrderLoadingState;

        return SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: isLoading ? null : () => _placeOrder(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              disabledBackgroundColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: isLoading
                ? SizedBox(
              width: 24.sp,
              height: 24.sp,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, size: 24.sp),
                SizedBox(width: 12.w),
                Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _placeOrder(BuildContext context) {
    final validationError = controller.validationError;

    if (validationError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(validationError),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<PlaceOrderCubit>().placeOrder(
      address: controller.fullAddress,
      phone: controller.phone,
      name: controller.name,
      email: controller.email,
      governorateId: controller.selectedGovernorateId.toString(), // Convert to String
      paymentMethod: controller.selectedPaymentMethod,
    );
  }
}