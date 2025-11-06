import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/model/order_history_model.dart';

class OrderHistoryCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback onTap;

  const OrderHistoryCard({super.key, required this.order, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(100),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(
                  text: 'Order #${order.orderCode}',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                _buildStatusBadge(order.status),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      text: 'Date',
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                    TextCustom(
                      text: order.orderDate,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextCustom(
                      text: 'Total',
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                    TextCustom(
                      text: '${order.total} EGP',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final statusData = _getStatusData(status);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: statusData['color'].withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: statusData['color']),
      ),
      child: TextCustom(
        text: statusData['label'],
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: statusData['color'],
      ),
    );
  }

  Map<String, dynamic> _getStatusData(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return {'label': 'Delivered', 'color': Colors.green};
      case 'pending':
        return {'label': 'Pending', 'color': Colors.orange};
      case 'cancelled':
        return {'label': 'Cancelled', 'color': Colors.red};
      default:
        return {'label': 'Processing', 'color': Colors.blue};
    }
  }
}
