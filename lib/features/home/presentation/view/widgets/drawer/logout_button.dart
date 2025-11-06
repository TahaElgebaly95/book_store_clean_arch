import 'package:book_store_mvvm/core/data/local/shared_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/routing/routs.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        SharedHelper.clear();
        context.push(Routs.loginRoute);
      },
      leading: const Icon(
        Icons.login,
        color: AppColors.kRed,
        size: 35,
      ),
      title: const TextCustom(
        text: 'Log Out',
        color: AppColors.kGrey,
        fontSize: 20,
      ),);
  }
}
