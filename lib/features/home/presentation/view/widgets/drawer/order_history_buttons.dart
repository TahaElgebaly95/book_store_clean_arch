import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/routing/routs.dart';

class OrderHistoryButton extends StatelessWidget {
  const OrderHistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            context.push(Routs.orderHistoryRoute);
          },
          leading: const Icon(Icons.history, color: AppColors.kGrey, size: 35),
          title: const TextCustom(
            text: 'Order History',
            color: AppColors.kGrey,
            fontSize: 20,
          ),
        ),
        const Divider(color: AppColors.kGrey, endIndent: 30, indent: 20),
      ],
    );
  }
}
