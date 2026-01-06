import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/routing/routs.dart';

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = AppColors.primaryColor
          ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, size.height * 0.65);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.85,
      size.width,
      size.height * 0.65,
    );
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? imageUrl;
  final VoidCallback? onLogout;
  final XFile? selectedImage;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.imageUrl,
    this.selectedImage,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: _WavePainter(),
          size: Size(double.infinity, 280.h),
        ),
        Positioned(
          top: 25.h,
          left: 16.w,
          child: GestureDetector(
            onTap: () {
              context.push(Routs.bottomNavBarRoute);
            },
            child: Icon(Icons.arrow_back, color: AppColors.kWhite, size: 28.sp),
          ),
        ),
        Positioned(
          top: 25.h,
          right: 16.w,
          child: GestureDetector(
            onTap: onLogout ?? () => context.push(Routs.loginRoute),
            child: Icon(Icons.logout, color: Colors.white, size: 28.sp),
          ),
        ),
        Positioned(
          top: 123.h,
          left: 0,
          right: 0,
          child: Column(
            children: [
              _buildAvatar(),
              SizedBox(height: 12.h),
              TextCustom(
                text: name,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              TextCustom(
                text: email,
                fontSize: 13.sp,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    if (selectedImage != null) {
      return CircleAvatar(
        radius: 50.r,
        backgroundImage: FileImage(File(selectedImage!.path)),
      );
    }
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: 50.r,
        backgroundImage: NetworkImage(imageUrl!),
      );
    }
    final initials =
        name.trim().split(' ').take(2).map((e) => e[0]).join().toUpperCase();
    return CircleAvatar(
      radius: 50.r,
      backgroundColor: AppColors.kBlack,
      child: TextCustom(
        text: initials.isEmpty ? 'U' : initials,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    );
  }
}
