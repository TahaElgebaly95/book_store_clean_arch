import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/model/show_single_order_model.dart';
import 'order_details_header.dart';
import 'order_details_items.dart';
import 'order_details_summary.dart';

class OrderDetailsContent extends StatelessWidget {
  final SingleOrderData order;

  const OrderDetailsContent({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          OrderDetailsHeader(order: order),
          SizedBox(height: 16.h),
          OrderDetailsItemsSection(order: order),
          SizedBox(height: 16.h),
          OrderDetailsSummarySection(order: order),
        ],
      ),
    );
  }
}