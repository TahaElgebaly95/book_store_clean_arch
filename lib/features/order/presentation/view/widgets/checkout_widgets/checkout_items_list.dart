import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/model/ckechout_model.dart';

class CheckoutItemsList extends StatelessWidget {
  final List<CartItem> items;

  const CheckoutItemsList({super.key, required this.items});

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
          Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.primaryColor,
                size: 24.sp,
              ),
              SizedBox(width: 8.w),
              TextCustom(
                text: 'Order Items (${items.length})',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.kBlack,
              ),
            ],
          ),

          SizedBox(height: 16.h),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => Divider(height: 20.h),
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildCartItem(item);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                text: item.itemProductName,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.kBlack,
              ),
              SizedBox(height: 4.h),
              TextCustom(
                text: 'Quantity: ${item.itemQuantity}',
                fontSize: 13.sp,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
        TextCustom(
          text: '${item.itemTotal} EGP',
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}