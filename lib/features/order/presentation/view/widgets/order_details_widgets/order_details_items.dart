import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/model/show_single_order_model.dart';

class OrderDetailsItemsSection extends StatelessWidget {
  final SingleOrderData order;

  const OrderDetailsItemsSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.shopping_bag_outlined, color: AppColors.primaryColor, size: 24.sp),
              SizedBox(width: 8.w),
              TextCustom(text: 'Order Items', fontSize: 16.sp, fontWeight: FontWeight.bold),
            ],
          ),
          SizedBox(height: 16.h),
          _buildItemsList(),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    final items = order.orderProducts;
    if (items.isEmpty) {
      return TextCustom(text: 'No items found', fontSize: 14.sp, color: Colors.grey[600]);
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(height: 16.h),
      itemBuilder: (context, index) => _buildItemRow(items[index]),
    );
  }

  Widget _buildItemRow(OrderProductModel item) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                text: item.productName,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 4.h),
              TextCustom(
                text: 'Qty: ${item.orderProductQuantity}',
                fontSize: 12.sp,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
        TextCustom(
          text: '${item.productPrice} EGP',
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}