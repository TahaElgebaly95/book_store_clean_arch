import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/routing/routs.dart';
import '../../../view_model/fetch_cart_cubit/fetch_cart_cubit.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCartCubit, FetchCartState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          alignment: Alignment.center,
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (state is FetchCartSuccessState)
                TextCustom(
                  text: 'Total price is ${state.cartModel.total} EGP',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.white,
                )
              else
                const SizedBox(),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Checkout
                  context.push(Routs.checkoutRoute);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: TextCustom(
                  text: 'Checkout',
                  fontSize: 15.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}