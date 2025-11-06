import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/show_single_order_cubit/show_single_order_cubit.dart';
import '../../../view_model/show_single_order_cubit/show_single_order_state.dart';
import '../order_history_widgets/orde_history_error_state.dart';
import '../order_history_widgets/orde_history_loading_state.dart';
import 'orde_details_content.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowSingleOrderCubit, ShowSingleOrderState>(
      builder: (context, state) {
        if (state is ShowSingleOrderLoading) {
          return const OrderLoadingState();
        }

        if (state is ShowSingleOrderSuccess) {
          final order = state.showSingleOrderModel.data;
          return OrderDetailsContent(order: order );
        }

        if (state is ShowSingleOrderError) {
          return OrderErrorState(
            message: state.message,
            onRetry: () {
              // Get orderId from context or pass it
              final cubit = context.read<ShowSingleOrderCubit>();
              // You might need to store orderId in cubit or pass it differently
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}