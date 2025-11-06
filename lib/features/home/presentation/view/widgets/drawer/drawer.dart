import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';
import 'change_pass_button.dart';
import 'contact_us_button.dart';
import 'edit_profile_button.dart';
import 'faq_button.dart';
import 'logo_email.dart';
import 'logout_button.dart';
import 'order_history_buttons.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          LogoAndEmail(),
          OrderHistoryButton(),
          EditProfileButton(),
          ChangePasswordButton(),
          Divider(color: AppColors.kGrey, endIndent: 30, indent: 20),
          LogOutButton(),
          Divider(color: AppColors.kGrey, endIndent: 30, indent: 20),
          ContactUsButton(),
          Divider(color: AppColors.kGrey, endIndent: 30, indent: 20),
          FaqButton(),
        ],
      ),
    );
  }
}
