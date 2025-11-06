import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/order_history_cubit/order_history_cubit.dart';
import '../../../view_model/order_history_cubit/order_history_state.dart';
import 'orde_history_empty_state.dart';
import 'orde_history_error_state.dart';
import 'orde_history_list.dart';
import 'orde_history_loading_state.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
      builder: (context, state) {
        if (state is OrderHistoryLoadingState) {
          return const OrderLoadingState();
        }

        if (state is OrderHistorySuccessState) {
          final orders = state.history.data;

          if (orders.orders.isEmpty) {
            return const OrderEmptyState(
              title: 'No Orders Yet',
              message: 'Your order history will appear here',
            );
          }

          return RefreshIndicator(
            onRefresh: () => context.read<OrderHistoryCubit>().getOrderHistory(),
            child: OrderHistoryList(orders: orders),
          );
        }

        if (state is OrderHistoryErrorState) {
          return OrderErrorState(
            message: state.error,
            onRetry: () => context.read<OrderHistoryCubit>().getOrderHistory(),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}