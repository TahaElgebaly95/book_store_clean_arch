import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/checkout_cubit/checkout_cubit.dart';
import 'checkout_address_section.dart';
import 'checkout_error_widget.dart';
import 'checkout_form_controller.dart';
import 'checkout_items_list.dart';
import 'checkout_listeners.dart';
import 'checkout_loading_widget.dart';
import 'checkout_payment_section.dart';
import 'checkout_summary.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  CheckoutFormController? _formController;

  @override
  void initState() {
    super.initState();
    context.read<CheckoutCubit>().getCheckout();
  }

  @override
  void dispose() {
    _formController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CheckoutListeners(
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoadingState) {
            return const CheckoutLoadingWidget();
          }

          if (state is CheckoutErrorState) {
            return CheckoutErrorWidget(
              message: state.error,
              onRetry: () => context.read<CheckoutCubit>().getCheckout(),
            );
          }

          if (state is CheckoutSuccessState) {
            _formController ??= CheckoutFormController(
              userData: state.checkoutModel.data.user,
            );

            return _buildContent(state);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent(CheckoutSuccessState state) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                CheckoutItemsList(items: state.checkoutModel.data.cartItems),
                SizedBox(height: 16.h),
                CheckoutAddressSection(
                  controller: _formController!,
                  onChanged: () => setState(() {}),
                ),
                SizedBox(height: 16.h),
                CheckoutPaymentSection(
                  controller: _formController!,
                  onChanged: () => setState(() {}),
                ),
                SizedBox(height: 16.h),
                CheckoutSummary(
                  checkout: state.checkoutModel.data,
                  controller: _formController!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}