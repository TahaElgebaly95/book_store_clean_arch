import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/model/order_history_model.dart';

class OrderHistoryCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback onTap;

  const OrderHistoryCard({
    super.key,
    required this.order,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              blurRadius: 8,
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
                Expanded(
                  child: TextCustom(
                    text: 'Order #${order.orderCode}',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildStatusBadge(order.status),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn(
                  label: 'Date',
                  value: order.orderDate,
                ),
                _buildInfoColumn(
                  label: 'Total',
                  value: '${order.total} EGP',
                  isPrice: true,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn({
    required String label,
    required String value,
    bool isPrice = false,
  }) {
    return Column(
      crossAxisAlignment: isPrice ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        TextCustom(
          text: label,
          fontSize: 12.sp,
          color: Colors.grey[600],
        ),
        SizedBox(height: 4.h),
        TextCustom(
          text: value,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: isPrice ? AppColors.primaryColor : Colors.black87,
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String status) {
    final config = _getStatusConfig(status);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: config['color'].withOpacity(0.1),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: config['color'].withOpacity(0.3),
        ),
      ),
      child: TextCustom(
        text: config['label'],
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        color: config['color'],
      ),
    );
  }

  Map<String, dynamic> _getStatusConfig(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return {'label': 'Delivered', 'color': Colors.green};
      case 'pending':
        return {'label': 'Pending', 'color': Colors.orange};
      case 'cancelled':
        return {'label': 'Cancelled', 'color': Colors.red};
      case 'processing':
        return {'label': 'Processing', 'color': Colors.blue};
      case 'shipped':
        return {'label': 'Shipped', 'color': Colors.purple};
      default:
        return {'label': 'Unknown', 'color': Colors.grey};
    }
  }
}