import 'package:book_store_mvvm/features/order/presentation/view/widgets/order_details_widgets/orde_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_custom.dart';
import '../../../../core/utils/colors.dart';
import '../view_model/show_single_order_cubit/show_single_order_cubit.dart';

class OrderDetailsView extends StatefulWidget {
  final int orderId;

  const OrderDetailsView({super.key, required this.orderId});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ShowSingleOrderCubit>().getOrderById(widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.kBlack),
        centerTitle: true,
        title: TextCustom(
          text: 'Order Details',
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      body: const OrderDetailsViewBody(),
    );
  }
}