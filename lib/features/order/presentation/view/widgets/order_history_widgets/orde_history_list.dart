import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/routing/routs.dart';
import '../../../../data/model/order_history_model.dart';
import 'order_history_card.dart';

class OrderHistoryList extends StatelessWidget {
  final OrderHistoryData orders;

  const OrderHistoryList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: orders.orders.length,
      itemBuilder: (context, index) {
        final order = orders.orders[index];
        return OrderHistoryCard(
          order: order,
          onTap: () {
            context.push(
              Routs.orderDetailsRoute,
              extra: order.id,
            );
          },
        );
      },
    );
  }
}