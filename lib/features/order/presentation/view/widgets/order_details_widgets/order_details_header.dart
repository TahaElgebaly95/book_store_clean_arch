import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../data/model/show_single_order_model.dart';

class OrderDetailsHeader extends StatelessWidget {
  final SingleOrderData order;

  const OrderDetailsHeader({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.grey.withAlpha(10), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustom(text: 'Order #${order.orderCode}', fontSize: 18.sp, fontWeight: FontWeight.bold),
              _buildStatusBadge(order.status ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildInfoRow('Order Date', order.orderDate ),
          SizedBox(height: 12.h),
          _buildInfoRow('Order ID', order.id.toString()),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCustom(text: label, fontSize: 14.sp, color: Colors.grey[600]),
        TextCustom(text: value, fontSize: 14.sp, fontWeight: FontWeight.w600),
      ],
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