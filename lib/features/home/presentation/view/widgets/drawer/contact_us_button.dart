import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/routing/routs.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.contact_support),
      title: const TextCustom(
        text: 'Contact Us',
        fontSize: 20,
        color: AppColors.kGrey,
        fontWeight: FontWeight.bold,
      ),
      onTap: () {
        Navigator.pop(context);
        context.push(Routs.contactUsRoute);
      },
    );
  }
}
