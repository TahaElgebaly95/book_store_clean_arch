import 'package:book_store_mvvm/core/components/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/routing/routs.dart';

class FaqButton extends StatelessWidget {
  const FaqButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.help_outline),
      title: const TextCustom(text: 'FAQ',
        fontSize: 20,
        color: AppColors.kGrey,
        fontWeight: FontWeight.bold,),
      onTap: () {
        Navigator.pop(context);
        context.push(Routs.faqRoute);
      },
    );
  }
}
