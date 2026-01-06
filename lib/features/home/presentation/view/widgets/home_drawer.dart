import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/data/local/shared_helper.dart';
import '../../../../../../core/data/local/shared_keys.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/routing/routs.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeader(),
          _DrawerMenuItem(
            icon: Icons.history,
            title: 'Order History',
            onTap: () => context.push(Routs.orderHistoryRoute),
          ),
          _DrawerMenuItem(
            icon: Icons.edit,
            title: 'Edit Profile',
            onTap: () => context.push(Routs.profileRoute),
          ),
          _DrawerMenuItem(
            icon: Icons.lock,
            title: 'Change Password',
            onTap: () => context.push(Routs.changePasswordRoute),
          ),
          const Divider(height: 1),
          _DrawerMenuItem(
            icon: Icons.logout,
            title: 'Logout',
            titleColor: Colors.red,
            iconColor: Colors.red,
            onTap: () {
              SharedHelper.clear();
              context.pushReplacement(Routs.loginRoute);
            },
          ),
          const Divider(height: 1),
          _DrawerMenuItem(
            icon: Icons.contact_support,
            title: 'Contact Us',
            onTap: () => context.push(Routs.contactUsRoute),
          ),
          _DrawerMenuItem(
            icon: Icons.help_outline,
            title: 'FAQ',
            onTap: () => context.push(Routs.faqRoute),
          ),
        ],
      ),
    );
  }
}

// ==================== Drawer Header ====================
class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = SharedHelper.get(key: SharedKey.name) ?? 'Guest';
    final email = SharedHelper.get(key: SharedKey.email) ?? '';

    return SizedBox(
      height: 210.h,
      child: DrawerHeader(
        decoration: const BoxDecoration(color: AppColors.primaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundColor: Colors.white,
              backgroundImage: const AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(height: 12.h),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),
            Text(
              email,
              style: TextStyle(color: Colors.white70, fontSize: 13.sp),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== Drawer Menu Item ====================
class _DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? titleColor;
  final Color? iconColor;

  const _DrawerMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.titleColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.grey[700], size: 24.sp),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          color: titleColor ?? Colors.grey[800],
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
    );
  }
}
