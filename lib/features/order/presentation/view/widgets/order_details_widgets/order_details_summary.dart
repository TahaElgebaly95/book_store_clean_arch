import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/model/show_single_order_model.dart';

class OrderDetailsSummarySection extends StatelessWidget {
  final SingleOrderData order;

  const OrderDetailsSummarySection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.receipt_long_outlined,
                color: AppColors.primaryColor,
                size: 24.sp,
              ),
              SizedBox(width: 8.w),
              TextCustom(
                text: 'Order Summary',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(height: 1.h),
          SizedBox(height: 16.h),
          _buildSummaryRow('Subtotal', '${order.subTotal } EGP'),
          SizedBox(height: 12.h),
           // _buildSummaryRow('Shipping', '${order.tax} EGP'),
           // SizedBox(height: 12.h),
          _buildSummaryRow('Tax', '${order.tax} EGP'),
          SizedBox(height: 16.h),
          Divider(height: 1.h),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustom(
                text: 'Total',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              TextCustom(
                text: '${order.total} EGP',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          _buildDeliveryInfo(),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCustom(text: label, fontSize: 14.sp, color: Colors.grey[600]),
        TextCustom(text: value??'0 EGP', fontSize: 14.sp, fontWeight: FontWeight.w600),
      ],
    );
  }

  Widget _buildDeliveryInfo() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.blue,
                size: 20.sp,
              ),
              SizedBox(width: 8.w),
              TextCustom(
                text: 'Delivery Address',
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          TextCustom(
            text: order.address,
            fontSize: 12.sp,
            color: Colors.grey[700],
          ),
          SizedBox(height: 8.h),
          TextCustom(
            text: order.notes??'No notes',
            fontSize: 12.sp,
            color: Colors.grey[700],
          ),

        ],
      ),
    );
  }
}