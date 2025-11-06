import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/routing/routs.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: () {
        context.push(Routs.profileRoute);
      },
      leading: const Icon(Icons.edit, color: AppColors.kGrey, size: 35),
      title: const TextCustom(
        text: 'Edit Profile',
        color: AppColors.kGrey,
        fontSize: 20,
      ),
    );
  }
}
